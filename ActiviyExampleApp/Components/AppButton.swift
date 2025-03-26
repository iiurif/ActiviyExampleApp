import SwiftUI

struct AppButton: View {
    
    let text: String
    var isDescructive: Bool = false
    var disable: Bool = false
    let action: () -> ()
    
    init(text: String, action: @escaping () -> (), isDescructive: Bool = false, disable: Bool = false) {
        self.text = text
        self.action = action
        self.isDescructive = isDescructive
        self.disable = disable
    }
    
    init(text: String, action: @escaping () -> (), isDescructive: Bool) {
        self.text = text
        self.action = action
        self.isDescructive = isDescructive
        self.disable = false
    }

    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .foregroundStyle(.accent)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(self.disable ? Color.gray : (self.isDescructive ? Color.red : Color.button))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(radius: self.disable ? 0 : 2, x: self.disable ? 0 : 2, y: self.disable ? 0 : 2)
        }
        .disabled(disable)
    }
}

