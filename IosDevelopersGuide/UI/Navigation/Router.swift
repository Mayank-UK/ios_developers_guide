//
//  Router.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 01/03/24.
//

import Foundation
import SwiftUI

class Router: ObservableObject {
    
    private let diContainer = DIContainer.shared
    
    enum routePaths: Hashable {
        case home
        
        case iosFundamentals
        
        case swiftFundamentals
        
        case swiftUi
        case swiftUiManipulation
        case swiftUiLifeCycle
        case swiftUiNavigationAndRouting
        case swiftUiStateManagement
        case swiftUiCatalog
        case swiftUiDebugging
        case swiftUiTesting
        case swiftUiSuppportingClassesAndEnums
        
        case swiftUiNativeFeaturesHandling
        case swiftUiCamera
        case swiftUiFaceId
        case swiftUiMicrophone
        case swiftUiSpeakers
        case swiftUiBluetooth
        case swiftUiWifi
        case swiftUiCompass
        case swiftUiAccelerometer
        case swiftUiProximitySensor
        case swiftUiAmbientLightSensor
        
        case swiftUiDesignSystem
        case swiftUiResponsiveDesign
        
        case swiftUiLayout
        case swiftUiPageLayout
        case swiftUiBasicLayout
        
        case swiftUiDimensionsAndConstraints
        case swiftUiSpacing
        case swiftUiColorsAndBackgrounds
        case swiftUiAlignment
        case swiftUiText
        case swiftUiBorders
        case swiftUiIconsAndImages
        case swiftUiEffects
        case swiftUiPositioning
        case swiftUiVisibility
        case swiftUiInteractiveBehaviours
        case swiftUiWeb
        case swiftUiForm
        case swiftUiMedia
        
        case swiftUiCatalogControls
        case swiftUiCatalogButtons
        case swiftUiCatalogToggle
        case swiftUiCatalogTextField
        case swiftUiCatalogTextEditor
        case swiftUiCatalogSecureField
        case swiftUiCatalogSlider
        case swiftUiCatalogPickers
        case swiftUiCatalogStepper
        case swiftUiCatalogMenus
        
        case swiftUiCatalogDisplayElements
        case swiftUiCatalogText
        case swiftUiCatalogImage
        case swiftUiCatalogLink
        case swiftUiCatalogWebView
        case swiftUiCatalogLabel
        case swiftUiCatalogProgressView
        case swiftUiCatalogGauge
        case swiftUiCatalogContentUnavailable
        case swiftUiCatalogShapes
        case swiftUiCatalogPath
        case swiftUiCatalogCanvas
        case swiftUiCatalogColor
        case swiftUiCatalogGradient
        case swiftUiCatalogSpacer
        case swiftUiCatalogDivider
        case swiftUiCatalogChart
        case swiftUiCatalogMap
        case swiftUiCatalogTable
        
        case swiftUiCatalogLayouts
        case swiftUiCatalogStacks
        case swiftUiCatalogList
        case swiftUiCatalogForEach
        case swiftUiCatalogGrids
        case swiftUiCatalogNavigationStack
        case swiftUiCatalogNavigationSplitView
        case swiftUiCatalogTab
        case swiftUiCatalogScrollView
        case swiftUiCatalogGeometryReader
        case swiftUiCatalogBackground
        case swiftUiCatalogOverlay
        case swiftUiCatalogDisclosureGroup
        case swiftUiCatalogOutlineGroup
        case swiftUiCatalogToolbar
        case swiftUiCatalogFrame
        case swiftUiCatalogSafeAreaInset
        case swiftUiCatalogEmptyView
        
        case swiftUiCatalogContainers
        case swiftUiCatalogGroup
        case swiftUiCatalogForm
        case swiftUiCatalogSection
        case swiftUiCatalogViewThatFits
        
        case swiftUiCatalogModals
        case swiftUiCatalogAlert
        case swiftUiCatalogConfirmationDialog
        case swiftUiCatalogNotification
        case swiftUiCatalogSheet
        case swiftUiCatalogInspector
        case swiftUiCatalogPopover
        
        case swiftUiCatalogMiscellaneous
        
        case uiKit
        
        case otherBasics
        
        case apiHandling
        case posts
        
        case databaseHandling
        
        case architecture
        
        case dependencyManagement
        
        case deployment
        
        case bestPractices
        
        case _temp
    }
    
    @Published var navigationStack: NavigationPath = NavigationPath()
    
    @MainActor @ViewBuilder func view(for route: routePaths) -> some View {
        switch route {
            case .home:
                HomeView(viewModel: HomeViewModel())
            
            case .iosFundamentals:
                IosFundamentalsView(viewModel: IosFundamentalsViewModel())
            
            case .swiftFundamentals:
                SwiftFundamentalsView(viewModel: SwiftFundamentalsViewModel())
            
            case .swiftUi:
                SwiftUiView(viewModel: SwiftUiViewModel())
            case .swiftUiManipulation:
                SwiftUiManipulationView(viewModel: SwiftUiManipulationViewModel())
            case .swiftUiLifeCycle:
                SwiftUiLifeCycleView(viewModel: SwiftUiLifeCycleViewModel())
            case .swiftUiNavigationAndRouting:
                SwiftUiNavigationAndRoutingView(viewModel: SwiftUiNavigationAndRoutingViewModel())
            case .swiftUiStateManagement:
                SwiftUiStateManagementView(viewModel: SwiftUiStateManagementViewModel())
            case .swiftUiCatalog:
                SwiftUiCatalogView(viewModel: SwiftUiCatalogViewModel())
            case .swiftUiDebugging:
                SwiftUiDebuggingView(viewModel: SwiftUiDebuggingViewModel())
            case .swiftUiTesting:
                SwiftUiTestingView(viewModel: SwiftUiTestingViewModel())
            case .swiftUiSuppportingClassesAndEnums:
                SwiftUiSupportingClassesAndEnumsView(viewModel: SwiftUiSupportingClassesAndEnumsViewModel())
            
            case .swiftUiNativeFeaturesHandling:
                SwiftUiNativeFeaturesView(viewModel: SwiftUiNativeFeaturesViewModel())
            case .swiftUiCamera:
                SwiftUICameraView(viewModel: SwiftUICameraViewModel())
            case .swiftUiFaceId:
                SwiftUIFaceIdView(viewModel: SwiftUIFaceIdViewModel())
            case .swiftUiMicrophone:
                SwiftUiMicrophoneView(viewModel: SwiftUiMicrophoneViewModel())
            case .swiftUiSpeakers:
                SwiftUiSpeakersView(viewModel: SwiftUiSpeakersViewModel())
            case .swiftUiBluetooth:
                SwiftUiBluetoothView(viewModel: SwiftUiBluetoothViewModel())
            case .swiftUiWifi:
                SwiftUiWifiView(viewModel: SwiftUiWifiViewModel())
            case .swiftUiCompass:
                SwiftUiCompassView(viewModel: SwiftUiCompassViewModel())
            case .swiftUiAccelerometer:
                SwiftUiAccelerometerView(viewModel: SwiftUiAccelerometerViewModel())
            case .swiftUiProximitySensor:
                SwiftUiProximitySensorView(viewModel: SwiftUiProximitySensorViewModel())
            case .swiftUiAmbientLightSensor:
                SwiftUiAmbientLightSensorView(viewModel: SwiftUiAmbientLightSensorViewModel())
            
            case .swiftUiDesignSystem:
                SwiftUiDesignSystemView(viewModel: SwiftUiDesignSystemViewModel())
            
            case .swiftUiResponsiveDesign:
                SwiftUiResponsiveDesignView(viewModel: SwiftUiResponsiveDesignViewModel())
            
            case .swiftUiLayout:
                SwiftUiLayoutView(viewModel: SwiftUiLayoutViewModel())
            case .swiftUiPageLayout:
                SwiftUiPageLayoutView(viewModel: SwiftUiPageLayoutViewModel())
            case .swiftUiBasicLayout:
                SwiftUiBasicLayoutView(viewModel: SwiftUiBasicLayoutViewModel())
            
            case .swiftUiDimensionsAndConstraints:
                SwiftUiDimensionsAndConstraintsView(viewModel: SwiftUiDimensionsAndConstraintsViewModel())
            case .swiftUiSpacing:
                SwiftUiSpacingView(viewModel: SwiftUiSpacingViewModel())
            case .swiftUiColorsAndBackgrounds:
                SwiftUiColorsAndBackgroundsView(viewModel: SwiftUiColorsAndBackgroundsViewModel())
            case .swiftUiAlignment:
                SwiftUiAlignmentView(viewModel: SwiftUiAlignmentViewModel())
            case .swiftUiText:
                SwiftUiTextView(viewModel: SwiftUiTextViewModel())
            case .swiftUiBorders:
                SwiftUiBordersView(viewModel: SwiftUiBordersViewModel())
            case .swiftUiIconsAndImages:
                SwiftUiIconsAndImagesView(viewModel: SwiftUiIconsAndImagesViewModel())
            case .swiftUiEffects:
                SwiftUiEffectsView(viewModel: SwiftUiEffectsViewModel())
            case .swiftUiPositioning:
                SwiftUiPositioningView(viewModel: SwiftUiPositioningViewModel())
            case .swiftUiVisibility:
                SwiftUiVisibilityView(viewModel: SwiftUiVisibilityViewModel())
            case .swiftUiInteractiveBehaviours:
                SwiftUiInteractiveBehavioursView(viewModel: SwiftUiInteractiveBehavioursViewModel())
            case .swiftUiWeb:
                SwiftUiWebView(viewModel: SwiftUiWebViewModel())
            case .swiftUiForm:
                SwiftUiFormView(viewModel: SwiftUiFormViewModel())
            case .swiftUiMedia:
                SwiftUiMediaView(viewModel: SwiftUiMediaViewModel())
            
            case .swiftUiCatalogControls:
                SwiftUiCatalogControlsView(viewModel: SwiftUiCatalogControlsViewModel())
            case .swiftUiCatalogButtons:
                SwiftUiCatalogButtonsView(viewModel: SwiftUiCatalogButtonsViewModel())
            case .swiftUiCatalogToggle:
                SwiftUiCatalogToggleView(viewModel: SwiftUiCatalogToggleViewModel())
            case .swiftUiCatalogTextField:
                SwiftUiCatalogTextFieldView(viewModel: SwiftUiCatalogTextFieldViewModel())
            case .swiftUiCatalogTextEditor:
                SwiftUiCatalogTextEditorView(viewModel: SwiftUiCatalogTextEditorViewModel())
            case .swiftUiCatalogSecureField:
                SwiftUiCatalogSecureFieldView(viewModel: SwiftUiCatalogSecureFieldViewModel())
            case .swiftUiCatalogSlider:
                SwiftUiCatalogSliderView(viewModel: SwiftUiCatalogSliderViewModel())
            case .swiftUiCatalogPickers:
                SwiftUiCatalogPickersView(viewModel: SwiftUiCatalogPickersViewModel())
            case .swiftUiCatalogStepper:
                SwiftUiCatalogStepperView(viewModel: SwiftUiCatalogStepperViewModel())
            case .swiftUiCatalogMenus:
                SwiftUiCatalogMenusView(viewModel: SwiftUiCatalogMenusViewModel())
            
            case .swiftUiCatalogDisplayElements:
                SwiftUiCatalogLayoutsView(viewModel: SwiftUiCatalogLayoutsViewModel())
            case .swiftUiCatalogText:
                SwiftUiCatalogTextView(viewModel: SwiftUiCatalogTextViewModel())
            case .swiftUiCatalogImage:
                SwiftUiCatalogImageView(viewModel: SwiftUiCatalogImageViewModel())
            case .swiftUiCatalogLink:
                SwiftUiCatalogLinkView(viewModel: SwiftUiCatalogLinkViewModel())
            case .swiftUiCatalogWebView:
                SwiftUiCatalogWebView(viewModel: SwiftUiCatalogWebViewModel())
            case .swiftUiCatalogLabel:
                SwiftUiCatalogLabelView(viewModel: SwiftUiCatalogLabelViewModel())
            case .swiftUiCatalogProgressView:
                SwiftUiCatalogProgressView(viewModel: SwiftUiCatalogProgressViewModel())
            case .swiftUiCatalogGauge:
                SwiftUiCatalogGaugeView(viewModel: SwiftUiCatalogGaugeViewModel())
            case .swiftUiCatalogContentUnavailable:
                SwiftUiCatalogContentUnavailableView(viewModel: SwiftUiCatalogContentUnavailableViewModel())
            case .swiftUiCatalogShapes:
                SwiftUiCatalogShapesView(viewModel: SwiftUiCatalogShapesViewModel())
            case .swiftUiCatalogPath:
                SwiftUiCatalogPathView(viewModel: SwiftUiCatalogPathViewModel())
            case .swiftUiCatalogCanvas:
                SwiftUiCatalogCanvasView(viewModel: SwiftUiCatalogCanvasViewModel())
            case .swiftUiCatalogColor:
                SwiftUiCatalogColorView(viewModel: SwiftUiCatalogColorViewModel())
            case .swiftUiCatalogGradient:
                SwiftUiCatalogGradientView(viewModel: SwiftUiCatalogGradientViewModel())
            case .swiftUiCatalogSpacer:
                SwiftUiCatalogSpacerView(viewModel: SwiftUiCatalogSpacerViewModel())
            case .swiftUiCatalogDivider:
                SwiftUiCatalogDividerView(viewModel: SwiftUiCatalogDividerViewModel())
            case .swiftUiCatalogChart:
                SwiftUiCatalogChartView(viewModel: SwiftUiCatalogChartViewModel())
            case .swiftUiCatalogMap:
                SwiftUiCatalogMapView(viewModel: SwiftUiCatalogMapViewModel())
            case .swiftUiCatalogTable:
                SwiftUiCatalogTableView(viewModel: SwiftUiCatalogTableViewModel())
            
            case .swiftUiCatalogLayouts:
                SwiftUiLayoutView(viewModel: SwiftUiLayoutViewModel())
            case .swiftUiCatalogStacks:
                SwiftUiCatalogStacksView(viewModel: SwiftUiCatalogStacksViewModel())
            case .swiftUiCatalogList:
                SwiftUiCatalogListView(viewModel: SwiftUiCatalogListViewModel())
            case .swiftUiCatalogForEach:
                SwiftUiCatalogForEachView(viewModel: SwiftUiCatalogForEachViewModel())
            case .swiftUiCatalogGrids:
                SwiftUiCatalogGridsView(viewModel: SwiftUiCatalogGridsViewModel())
            case .swiftUiCatalogNavigationStack:
                SwiftUiCatalogNavigationStackView(viewModel: SwiftUiCatalogNavigationStackViewModel())
            case .swiftUiCatalogNavigationSplitView:
                SwiftUiCatalogNavigationSplitView(viewModel: SwiftUiCatalogNavigationSplitViewModel())
            case .swiftUiCatalogTab:
                SwiftUiCatalogTabView(viewModel: SwiftUiCatalogTabViewModel())
            case .swiftUiCatalogScrollView:
                SwiftUiCatalogScrollView(viewModel: SwiftUiCatalogScrollViewModel())
            case .swiftUiCatalogGeometryReader:
                SwiftUiCatalogGeometryReaderView(viewModel: SwiftUiCatalogGeometryReaderViewModel())
            case .swiftUiCatalogBackground:
                SwiftUiCatalogBackgroundView(viewModel: SwiftUiCatalogBackgroundViewModel())
            case .swiftUiCatalogOverlay:
                SwiftUiCatalogOverlayView(viewModel: SwiftUiCatalogOverlayViewModel())
            case .swiftUiCatalogDisclosureGroup:
                SwiftUiCatalogDisclosureGroupView(viewModel: SwiftUiCatalogDisclosureGroupViewModel())
            case .swiftUiCatalogOutlineGroup:
                SwiftUiCatalogOutlineGroupView(viewModel: SwiftUiCatalogOutlineGroupViewModel())
            case .swiftUiCatalogToolbar:
                SwiftUiCatalogToolbarView(viewModel: SwiftUiCatalogToolbarViewModel())
            case .swiftUiCatalogFrame:
                SwiftUiCatalogFrameView(viewModel: SwiftUiCatalogFrameViewModel())
            case .swiftUiCatalogSafeAreaInset:
                SwiftUiCatalogSafeAreaInsetView(viewModel: SwiftUiCatalogSafeAreaInsetViewModel())
            case .swiftUiCatalogEmptyView:
                SwiftUiCatalogEmptyView(viewModel: SwiftUiCatalogEmptyViewModel())
            
            case .swiftUiCatalogContainers:
                SwiftUiCatalogContainersView(viewModel: SwiftUiCatalogContainersViewModel())
            case .swiftUiCatalogGroup:
                SwiftUiCatalogGroupView(viewModel: SwiftUiCatalogGroupViewModel())
            case .swiftUiCatalogForm:
                SwiftUiCatalogFormView(viewModel: SwiftUiCatalogFormViewModel())
            case .swiftUiCatalogSection:
                SwiftUiCatalogSectionView(viewModel: SwiftUiCatalogSectionViewModel())
            case .swiftUiCatalogViewThatFits:
                SwiftUiCatalogSectionView(viewModel: SwiftUiCatalogSectionViewModel())
            
            case .swiftUiCatalogModals:
                SwiftUiCatalogModalsView(viewModel: SwiftUiCatalogModalsViewModel())
            case .swiftUiCatalogAlert:
                SwiftUiCatalogAlertView(viewModel: SwiftUiCatalogAlertViewModel())
            case .swiftUiCatalogConfirmationDialog:
                SwiftUiCatalogConfirmationDialogView(viewModel: SwiftUiCatalogConfirmationDialogViewModel())
            case .swiftUiCatalogNotification:
                SwiftUiCatalogNotificationView(viewModel: SwiftUiCatalogNotificationViewModel())
            case .swiftUiCatalogSheet:
                SwiftUiCatalogSheetView(viewModel: SwiftUiCatalogSheetViewModel())
            case .swiftUiCatalogInspector:
                SwiftUiCatalogInspectorView(viewModel: SwiftUiCatalogInspectorViewModel())
            case .swiftUiCatalogPopover:
                SwiftUiCatalogPopoverView(viewModel: SwiftUiCatalogPopoverViewModel())
            
            case .swiftUiCatalogMiscellaneous:
                SwiftUiCatalogMiscellaneousView(viewModel: SwiftUiCatalogMiscellaneousViewModel())
            
            case .uiKit:
                UiKitView(viewModel: UiKitViewModel())
            
            case .otherBasics:
                OtherBasicsView(viewModel: OtherBasicsViewModel())
            
            case .apiHandling:
                ApiHandlingView(viewModel: ApiHandlingViewModel())
            
            case .posts:
                PostView(
                    viewModel: PostViewModel(
                        fetchPostsUseCase: DIContainer.shared.fetchPostsUseCase
                    )
                )
            
            case .databaseHandling:
                DatabaseHandlingView(viewModel: DatabaseHandlingViewModel())
            
            case .architecture:
                ArchitectureView(viewModel: ArchitectureViewModel())
            
            case .dependencyManagement:
                DependencyManagementView(viewModel: DependencyManagementViewModel())
            
            case .deployment:
                DeploymentView(viewModel: DeploymentViewModel())
            
            case .bestPractices:
                BestPracticesView(viewModel: BestPracticesViewModel())
            
            
            default:
                PageNotFoundView(viewModel: PageNotFoundViewModel())
        }
    }
    
    func navigateTo(routePath: routePaths) {
        navigationStack.append(routePath)
    }
    
    func navigateBack() {
        navigationStack.removeLast()
    }
    
    func popToRoot() {
        navigationStack.removeLast(navigationStack.count)
    }
}
