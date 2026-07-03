//
//  SwiftUICameraView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 10/04/24.
//

import SwiftUI
import AVFoundation

struct CameraView: View {
    @State private var isShowingCamera = false
    @State private var capturedImage: UIImage?

    var body: some View {
        VStack {
            if let image = capturedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
            } else {
                Text("Tap the button to take a photo")
                    .padding()
            }
            
            Button(action: {
                checkCameraPermission()
            }) {
                Text("Open Camera")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $isShowingCamera) {
                ImagePicker(sourceType: .camera, selectedImage: $capturedImage)
            }
        }
        .padding()
    }

    private func checkCameraPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            isShowingCamera = true
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    DispatchQueue.main.async {
                        isShowingCamera = true
                    }
                }
            }
        case .denied, .restricted:
            // Handle denied or restricted access
            print("Camera access denied or restricted")
        @unknown default:
            print("Unknown authorization status")
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    var sourceType: UIImagePickerController.SourceType
    @Binding var selectedImage: UIImage?

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            picker.dismiss(animated: true)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
}

struct SwiftUICameraView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUICameraViewModel
    
    func basics() -> some View {
        return CustomSection(
            snippetTitle: "Camera",
            snippetDescription: """
            Use device camera.
            """,
            snippetCode: """
            // first add the camera permissions in info.plist, in new xcode, info.plist is found in project settings info tab.
            
            struct CameraView: View {
                @State private var isShowingCamera = false
                @State private var capturedImage: UIImage?

                var body: some View {
                    VStack {
                        if let image = capturedImage {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding()
                        } else {
                            Text("Tap the button to take a photo")
                                .padding()
                        }
                        
                        Button(action: {
                            checkCameraPermission()
                        }) {
                            Text("Open Camera")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        .sheet(isPresented: $isShowingCamera) {
                            ImagePicker(sourceType: .camera, selectedImage: $capturedImage)
                        }
                    }
                    .padding()
                }

                private func checkCameraPermission() {
                    switch AVCaptureDevice.authorizationStatus(for: .video) {
                    case .authorized:
                        isShowingCamera = true
                    case .notDetermined:
                        AVCaptureDevice.requestAccess(for: .video) { granted in
                            if granted {
                                DispatchQueue.main.async {
                                    isShowingCamera = true
                                }
                            }
                        }
                    case .denied, .restricted:
                        // Handle denied or restricted access
                        print("Camera access denied or restricted")
                    @unknown default:
                        print("Unknown authorization status")
                    }
                }
            }

            struct ImagePicker: UIViewControllerRepresentable {
                var sourceType: UIImagePickerController.SourceType
                @Binding var selectedImage: UIImage?

                func makeUIViewController(context: Context) -> UIImagePickerController {
                    let picker = UIImagePickerController()
                    picker.sourceType = sourceType
                    picker.delegate = context.coordinator
                    return picker
                }

                func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

                func makeCoordinator() -> Coordinator {
                    Coordinator(self)
                }

                class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
                    let parent: ImagePicker

                    init(_ parent: ImagePicker) {
                        self.parent = parent
                    }

                    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                        if let image = info[.originalImage] as? UIImage {
                            parent.selectedImage = image
                        }
                        picker.dismiss(animated: true)
                    }

                    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
                        picker.dismiss(animated: true)
                    }
                }
            }

            CameraView()
            """,
            demoView: {
                CameraView()
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Camera",
            content: {
                basics()
            }
        )
    }
}

//#Preview {
//    SwiftUICameraView()
//}
