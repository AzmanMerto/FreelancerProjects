//
//  TimerButton.swift
//  FT Times
//
//  Created by NomoteteS on 24.02.2023.
//

import SwiftUI
import AVFoundation

struct TimerButton: View {
    
    var action : () -> ()
    var text : String
    
    @Binding var isDeactive : Bool
    @Binding var isActive : Bool
    @State var isThatChanged = false
    @State var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        Button {
            isThatChanged = true
            
            action()
        } label: {
            Text(text)
                .opacity(isActive ? 1 : 0.6 )
        }
        .buttonStyle(TimerButtonStyle(isChanged: $isThatChanged))
    }
    
}

struct TimerButton_Previews: PreviewProvider {
    static var previews: some View {
        TimerButton(action: {
            
        },
                    text: "SAYAÇ 1-2",
                    isDeactive: .constant(false),
                    isActive: .constant(true),
                    isThatChanged: false)
    }
}

struct TimerButtonStyle: ButtonStyle {
    
    @Binding var isChanged : Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .font(.system(.headline,weight: .bold))
            .padding(.all,20)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 1)
                    .background {
                        Color(isChanged ? .systemGreen : .systemPurple)
                            .cornerRadius(20)
                    }
                    
            }
    }
}


