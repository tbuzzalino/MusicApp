//
//  TableViewController.swift
//  ProyectoPersonal
//
//  Created by Tomas Buzzalino on 03/11/2021.
//

import UIKit

class TableViewController: UITableViewController, ButtonOnCellDelegate {
    
    var _misCanciones = [Track]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor(named: "ColorPrimario")
        self.tableView.rowHeight = 80
        // 1. Con esto le decimos al tableview de que tipo van a ser las celdas
        self.tableView.register(TrackTableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        
        // MARK 
        
        NotificationCenter.default.addObserver(self,
                                                        selector: #selector(updateTable(_ :)),
                                                        name: NSNotification.Name("updateTable"),
                                                        object: nil)

                        let _ = Timer.scheduledTimer(withTimeInterval: 30.0, repeats: true) { timer in
                            print("Timer fired!")
                            NotificationCenter.default.post(name: NSNotification.Name("updateTable"), object: nil)
                        }

            }

            @objc func updateTable(_ notification: Notification) {

//                    misTracks.append(Track(title: "Nueva cancion", artist: "Nuevo artista", album: "Nuevo album", song_id: "0", genre: ""))
                    tableView.reloadData()
                
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
           
        }

    func buttonTouchedOnCell(celda : UITableViewCell) {
        
        let apc = AudioPlayerViewController()
        guard let index = tableView.indexPath(for: celda) else { return }
        let song = misCanciones[index.item]
        apc.modalPresentationStyle = .fullScreen
        apc.track = song
        self.present(apc, animated: true)
        
        }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return misCanciones.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    // 2. Le pedimos al table view una celda y hacemos el CAST al tipo de clase que se registro en el paso 1.

    let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! TrackTableViewCell
    cell.backgroundColor = UIColor(named : "ColorPrimario")
    cell.textLabel?.textColor = UIColor(named: "ColorPrimario")
    let track = misCanciones[indexPath.row]
    cell.title.text = track.title
    cell.cancion.text = track.artist
    cell.parent = self
    return cell
    }

}
