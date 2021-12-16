//
//  DownloadManager.swift
//  ProyectoPersonal
//
//  Created by Tomas Buzzalino on 09/12/2021.
//

import Foundation

class DownloadManager : NSObject, ObservableObject {
    static var shared = DownloadManager()
    
    private var urlSession : URLSession!
    @Published var tasks : [URLSessionTask] = []
    
    override private init() {
        super.init()
        
        let config = URLSessionConfiguration.background(withIdentifier: "\(Bundle.main.bundleIdentifier!).background")
        
        urlSession = URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue())
        
        updateTasks()
    }
    
    func startDownload(url : URL) {
        let task = urlSession.downloadTask(with: url)
        task.resume()
        tasks.append(task)
    }
    
    private func updateTasks () {
        urlSession.getAllTasks { tasks in
            DispatchQueue.main.async {
                self.tasks = tasks
            }
        }
        
    }
}

extension DownloadManager : URLSessionDelegate, URLSessionDownloadDelegate {
    
    func urlSession(_: URLSession, downloadTask : URLSessionDownloadTask, didWriteData _: Int64, totalBytesWritten _: Int64, totalBytesExpectedToWrite _: Int64) {
        print("Progress \(downloadTask.progress.fractionCompleted)  - for - \(downloadTask)")
    }
    
    func urlSession(_: URLSession, downloadTask _: URLSessionDownloadTask, didFinishDownloadingTo location : URL) {
        print("Download Finished : \(location.absoluteString)")
    }
    
    func urlSession(_: URLSession, task: URLSessionTask, didCompleteWithError error : Error?) {
        if let error = error {
            print("Download error: \(String(describing: error))")
        } else {
            print("Task finished \(task)")
        }
    }
    
}
