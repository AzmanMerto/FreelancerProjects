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
        .foregroundColor(.white)
        .font(.system(.headline).bold())
        .padding(.all,20)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 1)
                .background {
                    Color(isThatChanged ? .systemGreen : .systemPurple)
                        .cornerRadius(20)
                }
        }
    }
    
}

struct TimerButton_Previews: PreviewProvider {
    static var previews: some View {
        TimerButton(text: "", isThatChanged: .constant(false)) {
            
        }
    }
}



