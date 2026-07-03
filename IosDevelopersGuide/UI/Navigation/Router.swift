//
//  Router.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 01/03/24.
//

import Foundation
import SwiftUI
import FactoryKit

class Router: ObservableObject {
    
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
        case swiftUiWebAndApps
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
        
        case swiftUiWidget
        
        case swiftUiOtherBasics
        case swiftUiBackgroundTask
        case swiftUiNotificationCenter
        case swiftUiNotification
        
        case uiKit
    
        case apiHandling
        case posts
        
        case databaseHandling
        
        case architecture
        
        case dependencyInjection
        
        case dependencyManagement
        
        case deployment
        
        case bestPractices
        
        case _temp
    }
    
    @Published var navigationStack: NavigationPath = NavigationPath()
    
    @MainActor @ViewBuilder func view(for route: routePaths) -> some View {
        switch route {
            case .home:
                HomeView(viewModel: Container.shared.homeViewModel())

            case .iosFundamentals:
                IosFundamentalsView(viewModel: Container.shared.iosFundamentalsViewModel())

            case .swiftFundamentals:
                SwiftFundamentalsView(viewModel: Container.shared.swiftFundamentalsViewModel())
            
            case .swiftUi:
                SwiftUiView(viewModel: Container.shared.swiftUiViewModel())
            case .swiftUiManipulation:
                SwiftUiManipulationView(viewModel: Container.shared.swiftUiManipulationViewModel())
            case .swiftUiLifeCycle:
                SwiftUiLifeCycleView(viewModel: Container.shared.swiftUiLifeCycleViewModel())
            case .swiftUiNavigationAndRouting:
                SwiftUiNavigationAndRoutingView(viewModel: Container.shared.swiftUiNavigationAndRoutingViewModel())
            case .swiftUiStateManagement:
                SwiftUiStateManagementView(viewModel: Container.shared.swiftUiStateManagementViewModel())
            case .swiftUiCatalog:
                SwiftUiCatalogView(viewModel: Container.shared.swiftUiCatalogViewModel())
            case .swiftUiDebugging:
                SwiftUiDebuggingView(viewModel: Container.shared.swiftUiDebuggingViewModel())
            case .swiftUiTesting:
                SwiftUiTestingView(viewModel: Container.shared.swiftUiTestingViewModel())
            case .swiftUiSuppportingClassesAndEnums:
                SwiftUiSupportingClassesAndEnumsView(viewModel: Container.shared.swiftUiSupportingClassesAndEnumsViewModel())
            
            case .swiftUiNativeFeaturesHandling:
                SwiftUiNativeFeaturesView(viewModel: Container.shared.swiftUiNativeFeaturesViewModel())
            case .swiftUiCamera:
                SwiftUICameraView(viewModel: Container.shared.swiftUICameraViewModel())
            case .swiftUiFaceId:
                SwiftUIFaceIdView(viewModel: Container.shared.swiftUIFaceIdViewModel())
            case .swiftUiMicrophone:
                SwiftUiMicrophoneView(viewModel: Container.shared.swiftUiMicrophoneViewModel())
            case .swiftUiSpeakers:
                SwiftUiSpeakersView(viewModel: Container.shared.swiftUiSpeakersViewModel())
            case .swiftUiBluetooth:
                SwiftUiBluetoothView(viewModel: Container.shared.swiftUiBluetoothViewModel())
            case .swiftUiWifi:
                SwiftUiWifiView(viewModel: Container.shared.swiftUiWifiViewModel())
            case .swiftUiCompass:
                SwiftUiCompassView(viewModel: Container.shared.swiftUiCompassViewModel())
            case .swiftUiAccelerometer:
                SwiftUiAccelerometerView(viewModel: Container.shared.swiftUiAccelerometerViewModel())
            case .swiftUiProximitySensor:
                SwiftUiProximitySensorView(viewModel: Container.shared.swiftUiProximitySensorViewModel())
            case .swiftUiAmbientLightSensor:
                SwiftUiAmbientLightSensorView(viewModel: Container.shared.swiftUiAmbientLightSensorViewModel())
            
            case .swiftUiDesignSystem:
                SwiftUiDesignSystemView(viewModel: Container.shared.swiftUiDesignSystemViewModel())
            case .swiftUiResponsiveDesign:
                SwiftUiResponsiveDesignView(viewModel: Container.shared.swiftUiResponsiveDesignViewModel())
            
            case .swiftUiLayout:
                SwiftUiLayoutView(viewModel: Container.shared.swiftUiLayoutViewModel())
            case .swiftUiPageLayout:
                SwiftUiPageLayoutView(viewModel: Container.shared.swiftUiPageLayoutViewModel())
            case .swiftUiBasicLayout:
                SwiftUiBasicLayoutView(viewModel: Container.shared.swiftUiBasicLayoutViewModel())
            
            case .swiftUiDimensionsAndConstraints:
                SwiftUiDimensionsAndConstraintsView(viewModel: Container.shared.swiftUiDimensionsAndConstraintsViewModel())
            case .swiftUiSpacing:
                SwiftUiSpacingView(viewModel: Container.shared.swiftUiSpacingViewModel())
            case .swiftUiColorsAndBackgrounds:
                SwiftUiColorsAndBackgroundsView(viewModel: Container.shared.swiftUiColorsAndBackgroundsViewModel())
            case .swiftUiAlignment:
                SwiftUiAlignmentView(viewModel: Container.shared.swiftUiAlignmentViewModel())
            case .swiftUiText:
                SwiftUiTextView(viewModel: Container.shared.swiftUiTextViewModel())
            case .swiftUiBorders:
                SwiftUiBordersView(viewModel: Container.shared.swiftUiBordersViewModel())
            case .swiftUiIconsAndImages:
                SwiftUiIconsAndImagesView(viewModel: Container.shared.swiftUiIconsAndImagesViewModel())
            case .swiftUiEffects:
                SwiftUiEffectsView(viewModel: Container.shared.swiftUiEffectsViewModel())
            case .swiftUiPositioning:
                SwiftUiPositioningView(viewModel: Container.shared.swiftUiPositioningViewModel())
            case .swiftUiVisibility:
                SwiftUiVisibilityView(viewModel: Container.shared.swiftUiVisibilityViewModel())
            case .swiftUiInteractiveBehaviours:
                SwiftUiInteractiveBehavioursView(viewModel: Container.shared.swiftUiInteractiveBehavioursViewModel())
            case .swiftUiWebAndApps:
                SwiftUiWebAndAppsView(viewModel: Container.shared.swiftUiWebAndAppsViewModel())
            case .swiftUiForm:
                SwiftUiFormView(viewModel: Container.shared.swiftUiFormViewModel())
            case .swiftUiMedia:
                SwiftUiMediaView(viewModel: Container.shared.swiftUiMediaViewModel())
            
            case .swiftUiCatalogControls:
                SwiftUiCatalogControlsView(viewModel: Container.shared.swiftUiCatalogControlsViewModel())
            case .swiftUiCatalogButtons:
                SwiftUiCatalogButtonsView(viewModel: Container.shared.swiftUiCatalogButtonsViewModel())
            case .swiftUiCatalogToggle:
                SwiftUiCatalogToggleView(viewModel: Container.shared.swiftUiCatalogToggleViewModel())
            case .swiftUiCatalogTextField:
                SwiftUiCatalogTextFieldView(viewModel: Container.shared.swiftUiCatalogTextFieldViewModel())
            case .swiftUiCatalogTextEditor:
                SwiftUiCatalogTextEditorView(viewModel: Container.shared.swiftUiCatalogTextEditorViewModel())
            case .swiftUiCatalogSecureField:
                SwiftUiCatalogSecureFieldView(viewModel: Container.shared.swiftUiCatalogSecureFieldViewModel())
            case .swiftUiCatalogSlider:
                SwiftUiCatalogSliderView(viewModel: Container.shared.swiftUiCatalogSliderViewModel())
            case .swiftUiCatalogPickers:
                SwiftUiCatalogPickersView(viewModel: Container.shared.swiftUiCatalogPickersViewModel())
            case .swiftUiCatalogStepper:
                SwiftUiCatalogStepperView(viewModel: Container.shared.swiftUiCatalogStepperViewModel())
            case .swiftUiCatalogMenus:
                SwiftUiCatalogMenusView(viewModel: Container.shared.swiftUiCatalogMenusViewModel())
            
            case .swiftUiCatalogDisplayElements:
                SwiftUiCatalogDisplayElementsView(viewModel: Container.shared.swiftUiCatalogDisplayElementsViewModel())
            case .swiftUiCatalogText:
                SwiftUiCatalogTextView(viewModel: Container.shared.swiftUiCatalogTextViewModel())
            case .swiftUiCatalogImage:
                SwiftUiCatalogImageView(viewModel: Container.shared.swiftUiCatalogImageViewModel())
            case .swiftUiCatalogLink:
                SwiftUiCatalogLinkView(viewModel: Container.shared.swiftUiCatalogLinkViewModel())
            case .swiftUiCatalogWebView:
                SwiftUiCatalogWebView(viewModel: Container.shared.swiftUiCatalogWebViewModel())
            case .swiftUiCatalogLabel:
                SwiftUiCatalogLabelView(viewModel: Container.shared.swiftUiCatalogLabelViewModel())
            case .swiftUiCatalogProgressView:
                SwiftUiCatalogProgressView(viewModel: Container.shared.swiftUiCatalogProgressViewModel())
            case .swiftUiCatalogGauge:
                SwiftUiCatalogGaugeView(viewModel: Container.shared.swiftUiCatalogGaugeViewModel())
            case .swiftUiCatalogContentUnavailable:
                SwiftUiCatalogContentUnavailableView(viewModel: Container.shared.swiftUiCatalogContentUnavailableViewModel())
            case .swiftUiCatalogShapes:
                SwiftUiCatalogShapesView(viewModel: Container.shared.swiftUiCatalogShapesViewModel())
            case .swiftUiCatalogPath:
                SwiftUiCatalogPathView(viewModel: Container.shared.swiftUiCatalogPathViewModel())
            case .swiftUiCatalogCanvas:
                SwiftUiCatalogCanvasView(viewModel: Container.shared.swiftUiCatalogCanvasViewModel())
            case .swiftUiCatalogColor:
                SwiftUiCatalogColorView(viewModel: Container.shared.swiftUiCatalogColorViewModel())
            case .swiftUiCatalogGradient:
                SwiftUiCatalogGradientView(viewModel: Container.shared.swiftUiCatalogGradientViewModel())
            case .swiftUiCatalogSpacer:
                SwiftUiCatalogSpacerView(viewModel: Container.shared.swiftUiCatalogSpacerViewModel())
            case .swiftUiCatalogDivider:
                SwiftUiCatalogDividerView(viewModel: Container.shared.swiftUiCatalogDividerViewModel())
            case .swiftUiCatalogChart:
                SwiftUiCatalogChartView(viewModel: Container.shared.swiftUiCatalogChartViewModel())
            case .swiftUiCatalogMap:
                SwiftUiCatalogMapView(viewModel: Container.shared.swiftUiCatalogMapViewModel())
            case .swiftUiCatalogTable:
                SwiftUiCatalogTableView(viewModel: Container.shared.swiftUiCatalogTableViewModel())
            
            case .swiftUiCatalogLayouts:
                SwiftUiCatalogLayoutsView(viewModel: Container.shared.swiftUiCatalogLayoutsViewModel())
            case .swiftUiCatalogStacks:
                SwiftUiCatalogStacksView(viewModel: Container.shared.swiftUiCatalogStacksViewModel())
            case .swiftUiCatalogList:
                SwiftUiCatalogListView(viewModel: Container.shared.swiftUiCatalogListViewModel())
            case .swiftUiCatalogForEach:
                SwiftUiCatalogForEachView(viewModel: Container.shared.swiftUiCatalogForEachViewModel())
            case .swiftUiCatalogGrids:
                SwiftUiCatalogGridsView(viewModel: Container.shared.swiftUiCatalogGridsViewModel())
            case .swiftUiCatalogNavigationStack:
                SwiftUiCatalogNavigationStackView(viewModel: Container.shared.swiftUiCatalogNavigationStackViewModel())
            case .swiftUiCatalogNavigationSplitView:
                SwiftUiCatalogNavigationSplitView(viewModel: Container.shared.swiftUiCatalogNavigationSplitViewModel())
            case .swiftUiCatalogTab:
                SwiftUiCatalogTabView(viewModel: Container.shared.swiftUiCatalogTabViewModel())
            case .swiftUiCatalogScrollView:
                SwiftUiCatalogScrollView(viewModel: Container.shared.swiftUiCatalogScrollViewModel())
            case .swiftUiCatalogGeometryReader:
                SwiftUiCatalogGeometryReaderView(viewModel: Container.shared.swiftUiCatalogGeometryReaderViewModel())
            case .swiftUiCatalogBackground:
                SwiftUiCatalogBackgroundView(viewModel: Container.shared.swiftUiCatalogBackgroundViewModel())
            case .swiftUiCatalogOverlay:
                SwiftUiCatalogOverlayView(viewModel: Container.shared.swiftUiCatalogOverlayViewModel())
            case .swiftUiCatalogDisclosureGroup:
                SwiftUiCatalogDisclosureGroupView(viewModel: Container.shared.swiftUiCatalogDisclosureGroupViewModel())
            case .swiftUiCatalogOutlineGroup:
                SwiftUiCatalogOutlineGroupView(viewModel: Container.shared.swiftUiCatalogOutlineGroupViewModel())
            case .swiftUiCatalogToolbar:
                SwiftUiCatalogToolbarView(viewModel: Container.shared.swiftUiCatalogToolbarViewModel())
            case .swiftUiCatalogFrame:
                SwiftUiCatalogFrameView(viewModel: Container.shared.swiftUiCatalogFrameViewModel())
            case .swiftUiCatalogSafeAreaInset:
                SwiftUiCatalogSafeAreaInsetView(viewModel: Container.shared.swiftUiCatalogSafeAreaInsetViewModel())
            case .swiftUiCatalogEmptyView:
                SwiftUiCatalogEmptyView(viewModel: Container.shared.swiftUiCatalogEmptyViewModel())
            
            case .swiftUiCatalogContainers:
                SwiftUiCatalogContainersView(viewModel: Container.shared.swiftUiCatalogContainersViewModel())
            case .swiftUiCatalogGroup:
                SwiftUiCatalogGroupView(viewModel: Container.shared.swiftUiCatalogGroupViewModel())
            case .swiftUiCatalogForm:
                SwiftUiCatalogFormView(viewModel: Container.shared.swiftUiCatalogFormViewModel())
            case .swiftUiCatalogSection:
                SwiftUiCatalogSectionView(viewModel: Container.shared.swiftUiCatalogSectionViewModel())
            case .swiftUiCatalogViewThatFits:
                SwiftUiCatalogViewThatFitsView(viewModel: Container.shared.swiftUiCatalogViewThatFitsViewModel())
            
            case .swiftUiCatalogModals:
                SwiftUiCatalogModalsView(viewModel: Container.shared.swiftUiCatalogModalsViewModel())
            case .swiftUiCatalogAlert:
                SwiftUiCatalogAlertView(viewModel: Container.shared.swiftUiCatalogAlertViewModel())
            case .swiftUiCatalogConfirmationDialog:
                SwiftUiCatalogConfirmationDialogView(viewModel: Container.shared.swiftUiCatalogConfirmationDialogViewModel())
            case .swiftUiCatalogNotification:
                SwiftUiCatalogNotificationView(viewModel: Container.shared.swiftUiCatalogNotificationViewModel())
            case .swiftUiCatalogSheet:
                SwiftUiCatalogSheetView(viewModel: Container.shared.swiftUiCatalogSheetViewModel())
            case .swiftUiCatalogInspector:
                SwiftUiCatalogInspectorView(viewModel: Container.shared.swiftUiCatalogInspectorViewModel())
            case .swiftUiCatalogPopover:
                SwiftUiCatalogPopoverView(viewModel: Container.shared.swiftUiCatalogPopoverViewModel())

            case .swiftUiCatalogMiscellaneous:
                SwiftUiCatalogMiscellaneousView(viewModel: Container.shared.swiftUiCatalogMiscellaneousViewModel())
            
            case .swiftUiWidget:
                SwiftUiWidgetView(viewModel: Container.shared.swiftUiWidgetViewModel())

            case .swiftUiOtherBasics:
                SwiftUiOtherBasicsView(viewModel: Container.shared.swiftUiOtherBasicsViewModel())
            case .swiftUiBackgroundTask:
                SwiftUiBackgroundTaskView(viewModel: Container.shared.swiftUiBackgroundTaskViewModel())
            case .swiftUiNotificationCenter:
                SwiftUiNotificationCenterView(viewModel: Container.shared.swiftUiNotificationCenterViewModel())
            case .swiftUiNotification:
                SwiftUiNotificationView(viewModel: Container.shared.swiftUiNotificationViewModel())
            
            case .uiKit:
                UiKitView()
            
            case .apiHandling:
                ApiHandlingView(viewModel: Container.shared.apiHandlingViewModel())

            case .posts:
                PostView(
                    viewModel: Container.shared.postViewModel()
                )

            case .databaseHandling:
                DatabaseHandlingView(viewModel: Container.shared.databaseHandlingViewModel())

            case .architecture:
                ArchitectureView(viewModel: Container.shared.architectureViewModel())
            

            case .dependencyInjection:
                DependencyInjectionView(viewModel: Container.shared.dependencyInjectionViewModel())

            case .dependencyManagement:
                DependencyManagementView(viewModel: Container.shared.dependencyManagementViewModel())

            case .deployment:
                DeploymentView(viewModel: Container.shared.deploymentViewModel())

            case .bestPractices:
                BestPracticesView(viewModel: Container.shared.bestPracticesViewModel())
            
            default:
                PageNotFoundView(viewModel: Container.shared.pageNotFoundViewModel())
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
