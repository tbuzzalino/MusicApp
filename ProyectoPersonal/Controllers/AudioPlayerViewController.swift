//
//  AudioPlayerViewController.swift
//  ProyectoPersonal
//
//  Created by Tomas Buzzalino on 05/11/2021.
//

import UIKit
import AudioPlayer


class AudioPlayerViewController: UIViewController {
    
    var isPlaying : Bool = true
    var timeActual: Any? = 0
    var song : AudioPlayer?
    var track : Track?
    
    // Propiedades computadas
    
    var botonPlay : UIButton = {
        let button1 = UIButton(type: .system)
        button1.setTitle("Play", for: .normal)
        button1.tintColor = UIColor(named : "ColorSecundario")
        button1.autoresizingMask = .flexibleWidth
        button1.translatesAutoresizingMaskIntoConstraints = true
        return button1
    }()
    
    var button : UIButton = {
        let button1 = UIButton(type: .system)
        button1.setTitle("Back to playlist", for: .normal)
        button1.tintColor = UIColor(named : "ColorSecundario")
        button1.autoresizingMask = .flexibleWidth
        button1.translatesAutoresizingMaskIntoConstraints = true
        return button1
    }()
    
    var botonPause : UIButton = {
        let button2 = UIButton(type: .system)
        button2.setTitle("Stop", for: .normal)
        button2.tintColor = UIColor(named : "ColorSecundario")
        button2.autoresizingMask = .flexibleWidth
        button2.translatesAutoresizingMaskIntoConstraints = true
        return button2
    }()
    
    var volumeSlider : UISlider = {
        let slider2 = UISlider()
        slider2.autoresizingMask = .flexibleWidth
        slider2.tintColor = .orange
        slider2.translatesAutoresizingMaskIntoConstraints = true
        slider2.value = 100
        return slider2
    }()
    
    var songSlider: UISlider = {
        let sliderSong = UISlider()
        sliderSong.autoresizingMask = .flexibleWidth
        sliderSong.translatesAutoresizingMaskIntoConstraints = false
        sliderSong.addTarget(self, action: #selector(sliderSongChange(_ :)), for: .valueChanged)
        return sliderSong
    }()
    
    var menu : UIButton = {
        let menu = UIButton()
        menu.setTitle("Estoy aca", for: .normal)
        return menu
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            song = try AudioPlayer(fileName: "ukulele.mp3")
            song?.play()
            timeActual = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateSlider), userInfo: nil, repeats: true)
                } catch {
                    print("Sound initialization failed")
                }
        
        self.view.backgroundColor = UIColor(named: "ColorPrimario")

        let label1 = UILabel()
        // Aca presento el titulo de la cancion.
        label1.text = track?.title
        label1.font = UIFont.systemFont(ofSize: 30)
        label1.textColor = UIColor(named : "ColorSecundario")
        label1.autoresizingMask = .flexibleWidth
        label1.translatesAutoresizingMaskIntoConstraints = true
        label1.frame=CGRect(x: 0, y: 50, width: self.view.frame.width, height: 50)
        label1.textAlignment = .center
        self.view.addSubview(label1)
        
        button.frame = CGRect(x: 100, y: 300, width: 200, height: 40)
        button.bordered()
        button.addTarget(self, action: #selector(prevView), for: .touchUpInside)
        self.view.addSubview(button)
        
        botonPlay.frame = CGRect(x: 20, y: 100, width: 100, height: 40)
        botonPlay.addTarget(self, action: #selector(reproducir), for: .touchUpInside)
        self.view.addSubview(botonPlay)
        
        botonPause.frame = CGRect(x: 300, y: 100, width: 100, height: 40)
        botonPause.addTarget(self, action: #selector(pausar), for: .touchUpInside)
        self.view.addSubview(botonPause)
        
        songSlider.maximumValue = Float(song!.duration)
        songSlider.tintColor = .orange
        songSlider.translatesAutoresizingMaskIntoConstraints = true
        songSlider.frame = CGRect(x: 20, y:150, width: self.view.frame.width-40, height: 50)
        songSlider.addTarget(self, action: #selector(sliderSongChange(_ :)), for: .valueChanged)
        self.view.addSubview(songSlider)
        
        let label2 = UILabel()
        label2.text = "Volume"
        label2.tintColor = UIColor(named : "ColorSecundario")
        label2.font = UIFont.systemFont(ofSize: 20)
        label2.autoresizingMask = .flexibleWidth
        label2.translatesAutoresizingMaskIntoConstraints = true
        label2.frame = CGRect(x: 20, y: 200, width: self.view.frame.width, height: 50)
        label2.textAlignment = .left
        self.view.addSubview(label2)
        
        volumeSlider.frame = CGRect(x: 20, y:250, width: self.view.frame.width-120, height: 50)
        volumeSlider.addTarget(self, action: #selector(volumen), for: .valueChanged)
        self.view.addSubview(volumeSlider)

        let gifImage = UIImageView()
        gifImage.alpha = 0.5
        gifImage.tintColor = UIColor(named : "ColorSecundario")
        gifImage.autoresizingMask = .flexibleWidth
        gifImage.translatesAutoresizingMaskIntoConstraints = true
        gifImage.frame = CGRect(x: 40, y: 350, width: 300, height: 300)
        let path = Bundle.main.path(forResource: "animacion", ofType: "gif")
        let data = try! Data(contentsOf: URL(fileURLWithPath: path!))
        gifImage.image = UIImage.animatedImage(withAnimatedGIFData: data)
        self.view.addSubview(gifImage)
        
        // UIMenu
        menu.tintColor = UIColor(named : "ColorSecundario")
        menu.setTitleColor(UIColor(named: "ColorSecundario"), for: .normal)
        menu.frame = CGRect(x: 200, y: 110, width: 20, height: 20)
        	
        if #available(iOS 14.0, *) {
            menu.menu = addMenu()
        } else {
            // Fallback on earlier versions
        }
        
        self.view.addSubview(menu)
    }

    func addMenu () -> UIMenu {
        let menuItems = UIMenu(title: "Menu", options: .displayInline, children: [
            UIAction(title : "Download", image: UIImage(systemName: "arrow.down"), handler: {
                (_) in
                DownloadManager.shared.startDownload(url: URL(string: "https://speed.hetzner.de/100MB.bin")!)
                self.alert(title: "Descargando!", message: ("Estas descargando \(self.track!.title)."), action: "Okay")
            } ),
            UIAction(title : "Add to playlist", image: UIImage(systemName: "plus.circle"), handler: {
                (_) in self.alert(title: "Add to playlist", message: "Added Song", action: "Continue")
                
            } ),
            UIAction(title : "Like", image: UIImage(systemName: "heart"), handler: {
                (_) in self.addedAlert("Cancion Likeada")
            } ),
            UIAction(title : "Delete from library", image: UIImage(systemName: "trash"), attributes: .destructive, handler: {
                (_) in let abc = misCanciones.firstIndex(of: self.track!)
                print(abc!)
                print(misCanciones)
                misCanciones.remove(at: abc!)
                print(misCanciones.count)
                
            } ),
            
        ])
        return menuItems
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
            if(isPlaying){
              isPlaying = false
                song?.fadeOut()
                print("No esta reproduciendo")
            } else {
                print("Me estoy reproduciendo")
                isPlaying = true
                song?.play()
                song?.volume = 1
                
            }
        }
    
    override func viewWillDisappear(_ animated: Bool) {
            song?.fadeOut()
            isPlaying = false
        }
    
    @objc func reproducir () {
        if(isPlaying){
            song?.fadeOut()
        }
        song?.play()
        song?.volume = 1
    }
    
    @objc func pausar () {
        song?.fadeOut()
    }
    
    @objc func volumen () {
        song?.volume = volumeSlider.value
    }
    
    @objc func sliderSongChange(_ sender:UISlider!)
    {
        self.timeActual = song?.currentTime
        self.song?.currentTime = TimeInterval(songSlider.value)
    }

    @objc func updateSlider(){
//        print("el currentime es \(Float(song!.currentTime))")
        self.songSlider.value = Float(song!.currentTime)
}
    @objc func prevView() {
            navigationController?.popViewController(animated: true)
            self.dismiss(animated: true, completion: nil)
            isPlaying = false
        }
}

  
