//
//  Router.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 01/03/24.
//

import Foundation
import SwiftUI

class Router: ObservableObject {
    
    enum routePaths: Hashable {
        case home
        
        case iosFundamentals
        case iosImportantConcepts
        case iosInstallationAndSetup
        case iosDevelopment
        
        case swiftFundamentals
        case swiftInstallation
        case swiftIntroduction
        case swiftVariablesAndConstants
        case swiftDataTypes
        case swiftInputAndOutput
        case swiftExpressionsAndStatements
        case swiftComments
        case swiftOptionals
        case swiftOperators
        case swiftControlFlow
        case swiftFunctions
        case swiftOop
        case swiftEnumAndStructs
        case swiftAdvanced
        
        case swiftUi
        case swiftUiManipulation
        case swiftUiLifeCycle
        case swiftUiNavigationAndRouting
        case swiftUiStateManagement
        case swiftUiApiHandling
        case swiftUiCodeArchitecture
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
        
        case swiftUiResponsiveDesign
        case swiftUiBestPractices
        
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
        
        case restApi
        
        case packageManager
        
        case deployment
        case deploymentTestBuild
        case deploymentProdBuild
        
        case _temp
    }
    
    @Published var navigationStack: NavigationPath = NavigationPath()
    
    @ViewBuilder func view(for route: routePaths) -> some View {
        switch route {
            case .home:
                HomeView()
            
            case .iosFundamentals:
                IosFundamentalsView()
            case .iosImportantConcepts:
                IosImportantConceptsView()
            case .iosInstallationAndSetup:
                IosInstallationAndSetupView()
            case .iosDevelopment:
                IosDevelopmentView()
            
            case .swiftFundamentals:
                SwiftFundamentalsView()
            case .swiftInstallation:
                SwiftInstallationView()
            case .swiftIntroduction:
                SwiftIntroductionView()
            case .swiftVariablesAndConstants:
                SwiftVariablesAndConstantsView()
            case .swiftDataTypes:
                SwiftDataTypesView()
            case .swiftInputAndOutput:
                SwiftInputAndOutputView()
            case .swiftExpressionsAndStatements:
                SwiftExpressionsAndStatementsView()
            case .swiftComments:
                SwiftCommentsView()
            case .swiftOptionals:
                SwiftOptionalsView()
            case .swiftOperators:
                SwiftOperatorsView()
            case .swiftControlFlow:
                SwiftControlFlowView()
            case .swiftFunctions:
                SwiftFunctionsView()
            case .swiftOop:
                SwiftOopView()
            case .swiftEnumAndStructs:
                SwiftEnumAndStructsView()
            case .swiftAdvanced:
                SwiftAdvancedView()
            
            case .swiftUi:
                SwiftUiView()
            case .swiftUiManipulation:
                SwiftUiManipulationView()
            case .swiftUiLifeCycle:
                SwiftUiLifeCycleView()
            case .swiftUiNavigationAndRouting:
                SwiftUiNavigationAndRoutingView()
            case .swiftUiStateManagement:
                SwiftUiStateManagementView()
            case .swiftUiApiHandling:
                SwiftUiApiHandlingView()
            case .swiftUiCodeArchitecture:
                SwiftUiCodeArchitectureView()
            case .swiftUiCatalog:
                SwiftUiCatalogView()
            case .swiftUiDebugging:
                SwiftUiDebuggingView()
            case .swiftUiTesting:
                SwiftUiTestingView()
            case .swiftUiSuppportingClassesAndEnums:
                SwiftUiSupportingClassesAndEnumsView()
            
            case .swiftUiNativeFeaturesHandling:
                SwiftUiNativeFeaturesView()
            case .swiftUiCamera:
                SwiftUICameraView()
            case .swiftUiFaceId:
                SwiftUIFaceIdView()
            case .swiftUiMicrophone:
                SwiftUiMicrophoneView()
            case .swiftUiSpeakers:
                SwiftUiSpeakersView()
            case .swiftUiBluetooth:
                SwiftUiBluetoothView()
            case .swiftUiWifi:
                SwiftUiWifiView()
            case .swiftUiCompass:
                SwiftUiCompassView()
            case .swiftUiAccelerometer:
                SwiftUiAccelerometerView()
            case .swiftUiProximitySensor:
                SwiftUiProximitySensorView()
            case .swiftUiAmbientLightSensor:
                SwiftUiAmbientLightSensorView()
            
            case .swiftUiResponsiveDesign:
                SwiftUiResponsiveDesignView()
            case .swiftUiBestPractices:
                SwiftUiBestPracticesView()
            
            case .swiftUiLayout:
                SwiftUiLayoutView()
            case .swiftUiPageLayout:
                SwiftUiPageLayoutView()
            case .swiftUiBasicLayout:
                SwiftUiBasicLayoutView()
            
            case .swiftUiDimensionsAndConstraints:
                SwiftUiDimensionsAndConstraintsView()
            case .swiftUiSpacing:
                SwiftUiSpacingView()
            case .swiftUiColorsAndBackgrounds:
                SwiftUiColorsAndBackgroundsView()
            case .swiftUiAlignment:
                SwiftUiAlignmentView()
            case .swiftUiText:
                SwiftUiTextView()
            case .swiftUiBorders:
                SwiftUiBordersView()
            case .swiftUiIconsAndImages:
                SwiftUiIconsAndImagesView()
            case .swiftUiEffects:
                SwiftUiEffectsView()
            case .swiftUiPositioning:
                SwiftUiPositioningView()
            case .swiftUiVisibility:
                SwiftUiVisibilityView()
            case .swiftUiInteractiveBehaviours:
                SwiftUiInteractiveBehavioursView()
            case .swiftUiWeb:
                SwiftUiWebView()
            case .swiftUiForm:
                SwiftUiFormView()
            case .swiftUiMedia:
                SwiftUiMediaView()
            
            case .swiftUiCatalogControls:
                SwiftUiCatalogControlsView()
            case .swiftUiCatalogButtons:
                SwiftUiCatalogButtonsView()
            case .swiftUiCatalogToggle:
                SwiftUiCatalogToggleView()
            case .swiftUiCatalogTextField:
                SwiftUiCatalogTextFieldView()
            case .swiftUiCatalogTextEditor:
                SwiftUiCatalogTextEditorView()
            case .swiftUiCatalogSecureField:
                SwiftUiCatalogSecureFieldView()
            case .swiftUiCatalogSlider:
                SwiftUiCatalogSliderView()
            case .swiftUiCatalogPickers:
                SwiftUiCatalogPickersView()
            case .swiftUiCatalogStepper:
                SwiftUiCatalogStepperView()
            case .swiftUiCatalogMenus:
                SwiftUiCatalogMenusView()
            
            case .swiftUiCatalogDisplayElements:
                SwiftUiCatalogLayoutsView()
            case .swiftUiCatalogText:
                SwiftUiCatalogTextView()
            case .swiftUiCatalogImage:
                SwiftUiCatalogImageView()
            case .swiftUiCatalogLink:
                SwiftUiCatalogLinkView()
            case .swiftUiCatalogWebView:
                SwiftUiCatalogWebView()
            case .swiftUiCatalogLabel:
                SwiftUiCatalogLabelView()
            case .swiftUiCatalogProgressView:
                SwiftUiCatalogProgressView()
            case .swiftUiCatalogGauge:
                SwiftUiCatalogGaugeView()
            case .swiftUiCatalogContentUnavailable:
                SwiftUiCatalogContentUnavailableView()
            case .swiftUiCatalogShapes:
                SwiftUiCatalogShapesView()
            case .swiftUiCatalogPath:
                SwiftUiCatalogPathView()
            case .swiftUiCatalogCanvas:
                SwiftUiCatalogCanvasView()
            case .swiftUiCatalogColor:
                SwiftUiCatalogColorView()
            case .swiftUiCatalogGradient:
                SwiftUiCatalogGradientView()
            case .swiftUiCatalogSpacer:
                SwiftUiCatalogSpacerView()
            case .swiftUiCatalogDivider:
                SwiftUiCatalogDividerView()
            case .swiftUiCatalogChart:
                SwiftUiCatalogChartView()
            case .swiftUiCatalogMap:
                SwiftUiCatalogMapView()
            case .swiftUiCatalogTable:
                SwiftUiCatalogTableView()
            
            
            case .swiftUiCatalogLayouts:
                SwiftUiLayoutView()
            case .swiftUiCatalogStacks:
                SwiftUiCatalogStacksView()
            case .swiftUiCatalogList:
                SwiftUiCatalogListView()
            case .swiftUiCatalogForEach:
                SwiftUiCatalogForEachView()
            case .swiftUiCatalogGrids:
                SwiftUiCatalogGridsView()
            case .swiftUiCatalogNavigationStack:
                SwiftUiCatalogNavigationStackView()
            case .swiftUiCatalogNavigationSplitView:
                SwiftUiCatalogNavigationSplitView()
            case .swiftUiCatalogTab:
                SwiftUiCatalogTabView()
            case .swiftUiCatalogScrollView:
                SwiftUiCatalogScrollView()
            case .swiftUiCatalogGeometryReader:
                SwiftUiCatalogGeometryReaderView()
            case .swiftUiCatalogBackground:
                SwiftUiCatalogBackgroundView()
            case .swiftUiCatalogOverlay:
                SwiftUiCatalogOverlayView()
            case .swiftUiCatalogDisclosureGroup:
                SwiftUiCatalogDisclosureGroupView()
            case .swiftUiCatalogOutlineGroup:
                SwiftUiCatalogOutlineGroupView()
            case .swiftUiCatalogToolbar:
                SwiftUiCatalogToolbarView()
            case .swiftUiCatalogFrame:
                SwiftUiCatalogFrameView()
            case .swiftUiCatalogSafeAreaInset:
                SwiftUiCatalogSafeAreaInsetView()
            case .swiftUiCatalogEmptyView:
                SwiftUiCatalogEmptyView()
            
            case .swiftUiCatalogContainers:
                SwiftUiCatalogContainersView()
            case .swiftUiCatalogGroup:
                SwiftUiCatalogGroupView()
            case .swiftUiCatalogForm:
                SwiftUiCatalogFormView()
            case .swiftUiCatalogSection:
                SwiftUiCatalogSectionView()
            case .swiftUiCatalogViewThatFits:
                SwiftUiCatalogSectionView()
            
            case .swiftUiCatalogModals:
                SwiftUiCatalogModalsView()
            case .swiftUiCatalogAlert:
                SwiftUiCatalogAlertView()
            case .swiftUiCatalogConfirmationDialog:
                SwiftUiCatalogConfirmationDialogView()
            case .swiftUiCatalogNotification:
                SwiftUiCatalogNotificationView()
            case .swiftUiCatalogSheet:
                SwiftUiCatalogSheetView()
            case .swiftUiCatalogInspector:
                SwiftUiCatalogInspectorView()
            case .swiftUiCatalogPopover:
                SwiftUiCatalogPopoverView()
            
            case .swiftUiCatalogMiscellaneous:
                SwiftUiCatalogMiscellaneousView()
            
            case .uiKit:
                UiKitView()
            
            case .packageManager:
                PackageManagerView()
            
            case .deployment:
                DeploymentView()
            case .deploymentTestBuild:
                DeploymentTestBuildView()
            case .deploymentProdBuild:
                DeploymentProdBuildView()
            
            
            default:
                PageNotFoundView()
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
