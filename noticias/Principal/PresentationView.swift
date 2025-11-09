//
//  PresentationView.swift
//  noticias
//
//  Created by Mac on 07/11/25.
//
import SwiftUI

struct WelcomeView: View {
    
    @State private var isDarkMode = true
    
    private enum Constants {
        static let imageSize: CGFloat = 120
        static let horizontalPadding: CGFloat = 30
        static let topPadding: CGFloat = 40
    }
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                header
                planetImage
                introductionText
                closingText
                
                Spacer()
            
                Button(action: toggleMode) {
                    Image(systemName: isDarkMode ? "circle.lefthalf.filled" : "circle.lefthalf")
                        .font(.system(size: 28))
                        .foregroundStyle(textColor)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .clipShape(Circle())
                        .accessibilityLabel(Text("Cambiar modo de color"))
                }
                .padding(.bottom, 20)
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
        .animation(.easeInOut(duration: 0.3), value: isDarkMode)
    }
}
private extension WelcomeView {
    
    var header: some View {
        Text("Welcome to Daily Planet")
            .foregroundStyle(textColor)
            .font(.largeTitle.bold())
            .multilineTextAlignment(.center)
            .padding(.top, Constants.topPadding)
            .accessibilityAddTraits(.isHeader)
    }
    
    var planetImage: some View {
        Image(systemName: "globe.americas.fill")
            .resizable()
            .scaledToFit()
            .frame(width: Constants.imageSize, height: Constants.imageSize)
            .foregroundStyle(isDarkMode ? Color.blue : Color.black)
            .padding(.vertical, 10)
            .accessibilityHidden(true)
    }
    
    var introductionText: some View {
        Text("""
        Bienvenido al periódico más ajetreado del mundo. Aquí verás noticias antes que nadie, te enterarás del mundo actual y pasarás un buen rato con esta nueva APP intuitiva.
        """)
        .foregroundStyle(textColor)
        .font(.body)
        .multilineTextAlignment(.center)
        .padding(.horizontal, Constants.horizontalPadding)
    }
    
    var closingText: some View {
        (
            Text("Ten un ")
                .foregroundStyle(isDarkMode ? .orange : .blue)
            + Text("SÚPER")
                .foregroundStyle(.red)
                .fontWeight(.bold)
            + Text(" día ☀️")
                .foregroundStyle(isDarkMode ? .orange : .blue)
        )
        .font(.system(size: 23, weight: .semibold))
        .multilineTextAlignment(.center)
        .padding(.top, 10)
    }
}

private extension WelcomeView {
    var backgroundColor: Color {
        isDarkMode ? .black : .white
    }
    
    var textColor: Color {
        isDarkMode ? .white : .black
    }
    
    func toggleMode() {
        withAnimation {
            isDarkMode.toggle()
        }
    }
}

#Preview {
    WelcomeView()
}

