//
//  PlayListDetailController.swift
//  ProyectoPersonal
//
//  Created by Tomas Buzzalino on 29/11/2021.
//

import UIKit

class PlayListDetailController: UIViewController, TracksPickerDelegate, UITableViewDelegate, UITableViewDataSource {
    var tracks = Set<Track>()
    var tracksArray = [Track]()
    var playlist : [Track] = []
    let tv = UITableView()
    
    func addTrack(track: Track) {
        tracks.insert(track)
        tracksArray = Array(tracks)
        tv.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tracksArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "track", for: indexPath)
        let track = tracksArray[indexPath.row]
        cell.textLabel?.text = track.title
        cell.backgroundColor = .black
        cell.textLabel?.textColor = .orange
        return cell
    }

    @IBAction func btn(_ sender: Any) {
        let trv = TracksPickerView (frame: CGRect(x: 0, y: self.view.frame.height/2, width: self.view.frame.width, height: self.view.frame.height/2))
            trv.delegate = self
            self.view.addSubview(trv)
    }
    @IBOutlet weak var addBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Tableview
        tv.frame = self.view.frame.insetBy(dx: 20, dy:200)
        tv.separatorColor = .orange
        tv.backgroundColor = .black
        tv.sectionIndexColor = .red
        tv.separatorStyle = .singleLine
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "track")
        tv.dataSource = self
        tv.delegate = self
        self.view.addSubview(tv)

    
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
