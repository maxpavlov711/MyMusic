//
//  TrackDetailView.swift
//  MyMusic
//
//  Created by Max Pavlov on 9.06.22.
//

import UIKit
import SDWebImage
import AVKit

class TrackDetailView: UIView {
    
    
    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var currentTimeSlider: UISlider!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var trackTitleLabel: UILabel!
    @IBOutlet weak var authorTitleLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    
    let player: AVPlayer = {
        let avPlayer = AVPlayer()
        avPlayer.automaticallyWaitsToMinimizeStalling = false
        return avPlayer
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        trackImageView.backgroundColor = .red
    }
    
    func set(viewModel: SearchViewModel.Cell) {
        trackTitleLabel.text = viewModel.trackName
        authorTitleLabel.text = viewModel.artistName
        playTrack(previewURL: viewModel.previewUrl)
        let string600 = viewModel.iconUrlString?.replacingOccurrences(of: "100x100", with: "600x600")
        guard let url = URL(string: string600 ?? "") else { return }
        trackImageView.sd_setImage(with: url)
    }
    
    private func playTrack(previewURL: String?) {
        print("Патюсь включить трэк по ссылке: \(previewURL ?? "отсутсвтует")")
        
        guard let url = URL(string: previewURL ?? "") else { return }
        let playerItem = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: playerItem)
        player.play()
    }
    
    @IBAction func handleValueSlider(_ sender: Any) {
    }
    @IBAction func handleCurrentTimerSlider(_ sender: Any) {
    }
    
    @IBAction func drugDownButtonTapped(_ sender: Any) {
        
        self.removeFromSuperview()
    }
    
    @IBAction func previusTrack(_ sender: Any) {
    }
    
    @IBAction func nextTrack(_ sender: Any) {
    }
    
    @IBAction func playPauseAction(_ sender: Any) {
        if player.timeControlStatus == .paused {
            player.play()
            playPauseButton.setImage(UIImage(named: "pause"), for: .normal)
        } else {
            player.pause()
            playPauseButton.setImage(UIImage(named: "play"), for: .normal)
        }
    }
}
