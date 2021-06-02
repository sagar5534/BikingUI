import SwiftUI
import FirebaseFirestore

struct Test: View {
    
    var modal = ModalManager()
    
    var body: some View {
        return ZStack {
            SomeView()
                .environmentObject(modal)

            ModalAnchorView()
                .environmentObject(modal)
        }
    }
}

struct SomeView: View {
  
    @EnvironmentObject var modalManager: ModalManager
    @State private var change = true
    let trip = Activity(
        tripName: "Monday Afternoon",
        distance: 10.55,
        movingTime: 1000,
        totalTime: 1200,
        speed: 20.3,
        pace: 1450,
        elevation: 70.0,
        date: Timestamp()
    )
    
    var body: some View {
        VStack {
           Button(action: self.modalManager.openModal) {
              Text("Open Modal")
           }
        }
        .onAppear {
            self.modalManager.newModal(position: .closed) {
                ActivityDetail(trip: trip)
            }
        }
    }
}

enum ModalState: CGFloat {
    
    case closed, open
    
    func offsetFromTop() -> CGFloat {
        switch self {
        case .closed:
            return UIScreen.main.bounds.height - 200
        case .open:
            return 0
        }
    }
}

struct Modal {
    var position: ModalState  = .closed
    var dragOffset: CGSize = .zero
    var content: AnyView?
}

struct ModalAnchorView: View {
    
    @EnvironmentObject var modalManager: ModalManager
    
    var body: some View {
        ModalView(modal: $modalManager.modal)
    }
}

class ModalManager: ObservableObject {
    
    @Published var modal: Modal = Modal(position: .closed, content: nil)
    
    func newModal<Content: View>(position: ModalState, @ViewBuilder content: () -> Content ) {
        modal = Modal(position: position, content: AnyView(content()))
    }
    
    func openModal() {
        modal.position = .open
    }
    
    func closeModal() {
        modal.position = .closed
    }
    
}

struct ModalView: View {
    
    @Binding var modal: Modal
    @GestureState var dragState: DragState = .inactive
    
    var animation: Animation {
        Animation
            .interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0)
            .delay(0)
    }
    
    var body: some View {
        
        let drag = DragGesture(minimumDistance: 30)
            .updating($dragState) { drag, state, transaction in
                state = .dragging(translation: drag.translation)
        }
        .onChanged {
            self.modal.dragOffset = $0.translation
        }
        .onEnded(onDragEnded)
        
        return GeometryReader(){ geometry in
            ZStack(alignment: .top) {
                Color.gray
                self.modal.content
            }
            .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
            .offset(y: max(0, self.modal.position.offsetFromTop() + self.dragState.translation.height + geometry.safeAreaInsets.top))
            .gesture(drag)
            .animation(self.dragState.isDragging ? nil : self.animation)
        }
        .edgesIgnoringSafeArea(.top)
    }
    
    private func onDragEnded(drag: DragGesture.Value) {
        
        let dragDirection = drag.predictedEndLocation.y - drag.location.y
        
        if dragDirection > 0 {
            modal.position = .closed
        } else if dragDirection < 0 {
            modal.position = .open
        }
    
    }
    
}

enum DragState {
    
    case inactive
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .dragging:
            return true
        }
    }
}
