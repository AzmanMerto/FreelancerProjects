//
//  TimerButton.swift
//  FT Times
//
//  Created by NomoteteS on 24.02.2023.
//

import SwiftUI
import AVFoundation

struct TimerButton: View {
  
    var text : String
    @Binding var isThatChanged : Bool
    var action : () -> ()
    
    
    var body: some View {
        Button {
            action()
            isThatChanged.toggle()
        } label: {
            Text(text)
        }
        .buttonStyle(TimerButtonStyle(isChanged: $isThatChanged))
    }
    
}

struct TimerButton_Previews: PreviewProvider {
    static var previews: some View {
        TimerButton(text: "", isThatChanged: .constant(false)) {
            
        }
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


