//
//  GenreButtonScreen.swift
//  MusicPlayer
//
//  Created by eyal avisar on 09/05/2020.
//  Copyright © 2020 eyal avisar. All rights reserved.
//

import UIKit
import MediaPlayer

class GenreButtonScreen: UIViewController {
  
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func genreButtonTapped(_ sender: Any) {
        
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized {
                let genreTapped:UIButton = sender as! UIButton
                self.playGenre(genre: genreTapped.currentTitle!)
            }
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        musicPlayer.skipToNextItem()
    }
    
    @IBAction func stopButtonTapped(_ sender: Any) {
        musicPlayer.stop()
    }
    
    func playGenre(genre:String) {
        
        musicPlayer.stop()
        
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predicate)
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
}
