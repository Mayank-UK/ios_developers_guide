//
//  ViewModelModule.swift
//  IosDevelopersGuide
//

import FactoryKit

extension Container {

    @MainActor
    var homeViewModel: Factory<HomeViewModel> {
        Factory(self) { HomeViewModel() }
    }

    @MainActor
    var iosFundamentalsViewModel: Factory<IosFundamentalsViewModel> {
        Factory(self) { IosFundamentalsViewModel() }
    }

    @MainActor
    var swiftFundamentalsViewModel: Factory<SwiftFundamentalsViewModel> {
        Factory(self) { SwiftFundamentalsViewModel() }
    }

    // MARK: - SwiftUI Core & Concepts
    @MainActor
    var swiftUiViewModel: Factory<SwiftUiViewModel> {
        Factory(self) { SwiftUiViewModel() }
    }

    @MainActor
    var swiftUiManipulationViewModel: Factory<SwiftUiManipulationViewModel> {
        Factory(self) { SwiftUiManipulationViewModel() }
    }

    @MainActor
    var swiftUiLifeCycleViewModel: Factory<SwiftUiLifeCycleViewModel> {
        Factory(self) { SwiftUiLifeCycleViewModel() }
    }

    @MainActor
    var swiftUiNavigationAndRoutingViewModel: Factory<SwiftUiNavigationAndRoutingViewModel> {
        Factory(self) { SwiftUiNavigationAndRoutingViewModel() }
    }

    @MainActor
    var swiftUiStateManagementViewModel: Factory<SwiftUiStateManagementViewModel> {
        Factory(self) { SwiftUiStateManagementViewModel() }
    }

    // MARK: - SwiftUI Advanced & Tooling
    @MainActor
    var swiftUiCatalogViewModel: Factory<SwiftUiCatalogViewModel> {
        Factory(self) { SwiftUiCatalogViewModel() }
    }

    @MainActor
    var swiftUiDebuggingViewModel: Factory<SwiftUiDebuggingViewModel> {
        Factory(self) { SwiftUiDebuggingViewModel() }
    }

    @MainActor
    var swiftUiTestingViewModel: Factory<SwiftUiTestingViewModel> {
        Factory(self) { SwiftUiTestingViewModel() }
    }

    @MainActor
    var swiftUiSupportingClassesAndEnumsViewModel: Factory<SwiftUiSupportingClassesAndEnumsViewModel> {
        Factory(self) { SwiftUiSupportingClassesAndEnumsViewModel() }
    }

    // MARK: - Native Features Handling
    @MainActor
    var swiftUiNativeFeaturesViewModel: Factory<SwiftUiNativeFeaturesViewModel> {
        Factory(self) { SwiftUiNativeFeaturesViewModel() }
    }

    @MainActor
    var swiftUICameraViewModel: Factory<SwiftUICameraViewModel> {
        Factory(self) { SwiftUICameraViewModel() }
    }

    @MainActor
    var swiftUIFaceIdViewModel: Factory<SwiftUIFaceIdViewModel> {
        Factory(self) { SwiftUIFaceIdViewModel() }
    }

    @MainActor
    var swiftUiMicrophoneViewModel: Factory<SwiftUiMicrophoneViewModel> {
        Factory(self) { SwiftUiMicrophoneViewModel() }
    }

    @MainActor
    var swiftUiSpeakersViewModel: Factory<SwiftUiSpeakersViewModel> {
        Factory(self) { SwiftUiSpeakersViewModel() }
    }

    @MainActor
    var swiftUiBluetoothViewModel: Factory<SwiftUiBluetoothViewModel> {
        Factory(self) { SwiftUiBluetoothViewModel() }
    }

    @MainActor
    var swiftUiWifiViewModel: Factory<SwiftUiWifiViewModel> {
        Factory(self) { SwiftUiWifiViewModel() }
    }

    @MainActor
    var swiftUiCompassViewModel: Factory<SwiftUiCompassViewModel> {
        Factory(self) { SwiftUiCompassViewModel() }
    }

    @MainActor
    var swiftUiAccelerometerViewModel: Factory<SwiftUiAccelerometerViewModel> {
        Factory(self) { SwiftUiAccelerometerViewModel() }
    }

    @MainActor
    var swiftUiProximitySensorViewModel: Factory<SwiftUiProximitySensorViewModel> {
        Factory(self) { SwiftUiProximitySensorViewModel() }
    }

    @MainActor
    var swiftUiAmbientLightSensorViewModel: Factory<SwiftUiAmbientLightSensorViewModel> {
        Factory(self) { SwiftUiAmbientLightSensorViewModel() }
    }
    
    // MARK: - Design & Layout
    @MainActor
    var swiftUiDesignSystemViewModel: Factory<SwiftUiDesignSystemViewModel> {
        Factory(self) { SwiftUiDesignSystemViewModel() }
    }

    @MainActor
    var swiftUiResponsiveDesignViewModel: Factory<SwiftUiResponsiveDesignViewModel> {
        Factory(self) { SwiftUiResponsiveDesignViewModel() }
    }
    
    @MainActor
    var swiftUiLayoutViewModel: Factory<SwiftUiLayoutViewModel> {
        Factory(self) { SwiftUiLayoutViewModel() }
    }

    @MainActor
    var swiftUiPageLayoutViewModel: Factory<SwiftUiPageLayoutViewModel> {
        Factory(self) { SwiftUiPageLayoutViewModel() }
    }

    @MainActor
    var swiftUiBasicLayoutViewModel: Factory<SwiftUiBasicLayoutViewModel> {
        Factory(self) { SwiftUiBasicLayoutViewModel() }
    }

    // MARK: - Dimensions, Styling & Layout Details
    @MainActor
    var swiftUiDimensionsAndConstraintsViewModel: Factory<SwiftUiDimensionsAndConstraintsViewModel> {
        Factory(self) { SwiftUiDimensionsAndConstraintsViewModel() }
    }

    @MainActor
    var swiftUiSpacingViewModel: Factory<SwiftUiSpacingViewModel> {
        Factory(self) { SwiftUiSpacingViewModel() }
    }

    @MainActor
    var swiftUiColorsAndBackgroundsViewModel: Factory<SwiftUiColorsAndBackgroundsViewModel> {
        Factory(self) { SwiftUiColorsAndBackgroundsViewModel() }
    }

    @MainActor
    var swiftUiAlignmentViewModel: Factory<SwiftUiAlignmentViewModel> {
        Factory(self) { SwiftUiAlignmentViewModel() }
    }

    @MainActor
    var swiftUiTextViewModel: Factory<SwiftUiTextViewModel> {
        Factory(self) { SwiftUiTextViewModel() }
    }

    @MainActor
    var swiftUiBordersViewModel: Factory<SwiftUiBordersViewModel> {
        Factory(self) { SwiftUiBordersViewModel() }
    }

    @MainActor
    var swiftUiIconsAndImagesViewModel: Factory<SwiftUiIconsAndImagesViewModel> {
        Factory(self) { SwiftUiIconsAndImagesViewModel() }
    }

    @MainActor
    var swiftUiEffectsViewModel: Factory<SwiftUiEffectsViewModel> {
        Factory(self) { SwiftUiEffectsViewModel() }
    }

    @MainActor
    var swiftUiPositioningViewModel: Factory<SwiftUiPositioningViewModel> {
        Factory(self) { SwiftUiPositioningViewModel() }
    }

    @MainActor
    var swiftUiVisibilityViewModel: Factory<SwiftUiVisibilityViewModel> {
        Factory(self) { SwiftUiVisibilityViewModel() }
    }

    @MainActor
    var swiftUiInteractiveBehavioursViewModel: Factory<SwiftUiInteractiveBehavioursViewModel> {
        Factory(self) { SwiftUiInteractiveBehavioursViewModel() }
    }

    @MainActor
    var swiftUiWebAndAppsViewModel: Factory<SwiftUiWebAndAppsViewModel> {
        Factory(self) { SwiftUiWebAndAppsViewModel() }
    }

    @MainActor
    var swiftUiFormViewModel: Factory<SwiftUiFormViewModel> {
        Factory(self) { SwiftUiFormViewModel() }
    }

    @MainActor
    var swiftUiMediaViewModel: Factory<SwiftUiMediaViewModel> {
        Factory(self) { SwiftUiMediaViewModel() }
    }

    // MARK: - Catalog Controls
    @MainActor
    var swiftUiCatalogControlsViewModel: Factory<SwiftUiCatalogControlsViewModel> {
        Factory(self) { SwiftUiCatalogControlsViewModel() }
    }

    @MainActor
    var swiftUiCatalogButtonsViewModel: Factory<SwiftUiCatalogButtonsViewModel> {
        Factory(self) { SwiftUiCatalogButtonsViewModel() }
    }

    @MainActor
    var swiftUiCatalogToggleViewModel: Factory<SwiftUiCatalogToggleViewModel> {
        Factory(self) { SwiftUiCatalogToggleViewModel() }
    }

    @MainActor
    var swiftUiCatalogTextFieldViewModel: Factory<SwiftUiCatalogTextFieldViewModel> {
        Factory(self) { SwiftUiCatalogTextFieldViewModel() }
    }

    @MainActor
    var swiftUiCatalogTextEditorViewModel: Factory<SwiftUiCatalogTextEditorViewModel> {
        Factory(self) { SwiftUiCatalogTextEditorViewModel() }
    }

    @MainActor
    var swiftUiCatalogSecureFieldViewModel: Factory<SwiftUiCatalogSecureFieldViewModel> {
        Factory(self) { SwiftUiCatalogSecureFieldViewModel() }
    }

    @MainActor
    var swiftUiCatalogSliderViewModel: Factory<SwiftUiCatalogSliderViewModel> {
        Factory(self) { SwiftUiCatalogSliderViewModel() }
    }

    @MainActor
    var swiftUiCatalogPickersViewModel: Factory<SwiftUiCatalogPickersViewModel> {
        Factory(self) { SwiftUiCatalogPickersViewModel() }
    }

    @MainActor
    var swiftUiCatalogStepperViewModel: Factory<SwiftUiCatalogStepperViewModel> {
        Factory(self) { SwiftUiCatalogStepperViewModel() }
    }

    @MainActor
    var swiftUiCatalogMenusViewModel: Factory<SwiftUiCatalogMenusViewModel> {
        Factory(self) { SwiftUiCatalogMenusViewModel() }
    }

    // MARK: - Catalog Display Elements
    @MainActor
    var swiftUiCatalogDisplayElementsViewModel: Factory<SwiftUiCatalogDisplayElementsViewModel> {
        Factory(self) { SwiftUiCatalogDisplayElementsViewModel() }
    }

    @MainActor
    var swiftUiCatalogTextViewModel: Factory<SwiftUiCatalogTextViewModel> {
        Factory(self) { SwiftUiCatalogTextViewModel() }
    }

    @MainActor
    var swiftUiCatalogImageViewModel: Factory<SwiftUiCatalogImageViewModel> {
        Factory(self) { SwiftUiCatalogImageViewModel() }
    }

    @MainActor
    var swiftUiCatalogLinkViewModel: Factory<SwiftUiCatalogLinkViewModel> {
        Factory(self) { SwiftUiCatalogLinkViewModel() }
    }

    @MainActor
    var swiftUiCatalogWebViewModel: Factory<SwiftUiCatalogWebViewModel> {
        Factory(self) { SwiftUiCatalogWebViewModel() }
    }

    @MainActor
    var swiftUiCatalogLabelViewModel: Factory<SwiftUiCatalogLabelViewModel> {
        Factory(self) { SwiftUiCatalogLabelViewModel() }
    }

    @MainActor
    var swiftUiCatalogProgressViewModel: Factory<SwiftUiCatalogProgressViewModel> {
        Factory(self) { SwiftUiCatalogProgressViewModel() }
    }

    @MainActor
    var swiftUiCatalogGaugeViewModel: Factory<SwiftUiCatalogGaugeViewModel> {
        Factory(self) { SwiftUiCatalogGaugeViewModel() }
    }

    @MainActor
    var swiftUiCatalogContentUnavailableViewModel: Factory<SwiftUiCatalogContentUnavailableViewModel> {
        Factory(self) { SwiftUiCatalogContentUnavailableViewModel() }
    }

    @MainActor
    var swiftUiCatalogShapesViewModel: Factory<SwiftUiCatalogShapesViewModel> {
        Factory(self) { SwiftUiCatalogShapesViewModel() }
    }

    @MainActor
    var swiftUiCatalogPathViewModel: Factory<SwiftUiCatalogPathViewModel> {
        Factory(self) { SwiftUiCatalogPathViewModel() }
    }

    @MainActor
    var swiftUiCatalogCanvasViewModel: Factory<SwiftUiCatalogCanvasViewModel> {
        Factory(self) { SwiftUiCatalogCanvasViewModel() }
    }

    @MainActor
    var swiftUiCatalogColorViewModel: Factory<SwiftUiCatalogColorViewModel> {
        Factory(self) { SwiftUiCatalogColorViewModel() }
    }

    @MainActor
    var swiftUiCatalogGradientViewModel: Factory<SwiftUiCatalogGradientViewModel> {
        Factory(self) { SwiftUiCatalogGradientViewModel() }
    }

    @MainActor
    var swiftUiCatalogSpacerViewModel: Factory<SwiftUiCatalogSpacerViewModel> {
        Factory(self) { SwiftUiCatalogSpacerViewModel() }
    }

    @MainActor
    var swiftUiCatalogDividerViewModel: Factory<SwiftUiCatalogDividerViewModel> {
        Factory(self) { SwiftUiCatalogDividerViewModel() }
    }

    @MainActor
    var swiftUiCatalogChartViewModel: Factory<SwiftUiCatalogChartViewModel> {
        Factory(self) { SwiftUiCatalogChartViewModel() }
    }

    @MainActor
    var swiftUiCatalogMapViewModel: Factory<SwiftUiCatalogMapViewModel> {
        Factory(self) { SwiftUiCatalogMapViewModel() }
    }

    @MainActor
    var swiftUiCatalogTableViewModel: Factory<SwiftUiCatalogTableViewModel> {
        Factory(self) { SwiftUiCatalogTableViewModel() }
    }

    // MARK: - Catalog Layouts & Containers
    @MainActor
    var swiftUiCatalogLayoutsViewModel: Factory<SwiftUiCatalogLayoutsViewModel> {
        Factory(self) { SwiftUiCatalogLayoutsViewModel() }
    }

    @MainActor
    var swiftUiCatalogStacksViewModel: Factory<SwiftUiCatalogStacksViewModel> {
        Factory(self) { SwiftUiCatalogStacksViewModel() }
    }

    @MainActor
    var swiftUiCatalogListViewModel: Factory<SwiftUiCatalogListViewModel> {
        Factory(self) { SwiftUiCatalogListViewModel() }
    }

    @MainActor
    var swiftUiCatalogForEachViewModel: Factory<SwiftUiCatalogForEachViewModel> {
        Factory(self) { SwiftUiCatalogForEachViewModel() }
    }

    @MainActor
    var swiftUiCatalogGridsViewModel: Factory<SwiftUiCatalogGridsViewModel> {
        Factory(self) { SwiftUiCatalogGridsViewModel() }
    }

    @MainActor
    var swiftUiCatalogNavigationStackViewModel: Factory<SwiftUiCatalogNavigationStackViewModel> {
        Factory(self) { SwiftUiCatalogNavigationStackViewModel() }
    }

    @MainActor
    var swiftUiCatalogNavigationSplitViewModel: Factory<SwiftUiCatalogNavigationSplitViewModel> {
        Factory(self) { SwiftUiCatalogNavigationSplitViewModel() }
    }

    @MainActor
    var swiftUiCatalogTabViewModel: Factory<SwiftUiCatalogTabViewModel> {
        Factory(self) { SwiftUiCatalogTabViewModel() }
    }

    @MainActor
    var swiftUiCatalogScrollViewModel: Factory<SwiftUiCatalogScrollViewModel> {
        Factory(self) { SwiftUiCatalogScrollViewModel() }
    }

    @MainActor
    var swiftUiCatalogGeometryReaderViewModel: Factory<SwiftUiCatalogGeometryReaderViewModel> {
        Factory(self) { SwiftUiCatalogGeometryReaderViewModel() }
    }

    @MainActor
    var swiftUiCatalogBackgroundViewModel: Factory<SwiftUiCatalogBackgroundViewModel> {
        Factory(self) { SwiftUiCatalogBackgroundViewModel() }
    }

    @MainActor
    var swiftUiCatalogOverlayViewModel: Factory<SwiftUiCatalogOverlayViewModel> {
        Factory(self) { SwiftUiCatalogOverlayViewModel() }
    }

    @MainActor
    var swiftUiCatalogDisclosureGroupViewModel: Factory<SwiftUiCatalogDisclosureGroupViewModel> {
        Factory(self) { SwiftUiCatalogDisclosureGroupViewModel() }
    }

    @MainActor
    var swiftUiCatalogOutlineGroupViewModel: Factory<SwiftUiCatalogOutlineGroupViewModel> {
        Factory(self) { SwiftUiCatalogOutlineGroupViewModel() }
    }

    @MainActor
    var swiftUiCatalogToolbarViewModel: Factory<SwiftUiCatalogToolbarViewModel> {
        Factory(self) { SwiftUiCatalogToolbarViewModel() }
    }

    @MainActor
    var swiftUiCatalogFrameViewModel: Factory<SwiftUiCatalogFrameViewModel> {
        Factory(self) { SwiftUiCatalogFrameViewModel() }
    }

    @MainActor
    var swiftUiCatalogSafeAreaInsetViewModel: Factory<SwiftUiCatalogSafeAreaInsetViewModel> {
        Factory(self) { SwiftUiCatalogSafeAreaInsetViewModel() }
    }

    @MainActor
    var swiftUiCatalogEmptyViewModel: Factory<SwiftUiCatalogEmptyViewModel> {
        Factory(self) { SwiftUiCatalogEmptyViewModel() }
    }

    // MARK: - Catalog Containers (Part 2)
    @MainActor
    var swiftUiCatalogContainersViewModel: Factory<SwiftUiCatalogContainersViewModel> {
        Factory(self) { SwiftUiCatalogContainersViewModel() }
    }

    @MainActor
    var swiftUiCatalogGroupViewModel: Factory<SwiftUiCatalogGroupViewModel> {
        Factory(self) { SwiftUiCatalogGroupViewModel() }
    }

    @MainActor
    var swiftUiCatalogFormViewModel: Factory<SwiftUiCatalogFormViewModel> {
        Factory(self) { SwiftUiCatalogFormViewModel() }
    }

    @MainActor
    var swiftUiCatalogSectionViewModel: Factory<SwiftUiCatalogSectionViewModel> {
        Factory(self) { SwiftUiCatalogSectionViewModel() }
    }

    @MainActor
    var swiftUiCatalogViewThatFitsViewModel: Factory<SwiftUiCatalogViewThatFitsViewModel> {
        Factory(self) { SwiftUiCatalogViewThatFitsViewModel() }
    }

    // MARK: - Catalog Modals & Overlays
    @MainActor
    var swiftUiCatalogModalsViewModel: Factory<SwiftUiCatalogModalsViewModel> {
        Factory(self) { SwiftUiCatalogModalsViewModel() }
    }

    @MainActor
    var swiftUiCatalogAlertViewModel: Factory<SwiftUiCatalogAlertViewModel> {
        Factory(self) { SwiftUiCatalogAlertViewModel() }
    }

    @MainActor
    var swiftUiCatalogConfirmationDialogViewModel: Factory<SwiftUiCatalogConfirmationDialogViewModel> {
        Factory(self) { SwiftUiCatalogConfirmationDialogViewModel() }
    }

    @MainActor
    var swiftUiCatalogNotificationViewModel: Factory<SwiftUiCatalogNotificationViewModel> {
        Factory(self) { SwiftUiCatalogNotificationViewModel() }
    }

    @MainActor
    var swiftUiCatalogSheetViewModel: Factory<SwiftUiCatalogSheetViewModel> {
        Factory(self) { SwiftUiCatalogSheetViewModel() }
    }

    @MainActor
    var swiftUiCatalogInspectorViewModel: Factory<SwiftUiCatalogInspectorViewModel> {
        Factory(self) { SwiftUiCatalogInspectorViewModel() }
    }

    @MainActor
    var swiftUiCatalogPopoverViewModel: Factory<SwiftUiCatalogPopoverViewModel> {
        Factory(self) { SwiftUiCatalogPopoverViewModel() }
    }

    // MARK: - Miscellaneous, Widgets & System Services
    @MainActor
    var swiftUiCatalogMiscellaneousViewModel: Factory<SwiftUiCatalogMiscellaneousViewModel> {
        Factory(self) { SwiftUiCatalogMiscellaneousViewModel() }
    }

    @MainActor
    var swiftUiWidgetViewModel: Factory<SwiftUiWidgetViewModel> {
        Factory(self) { SwiftUiWidgetViewModel() }
    }

    @MainActor
    var swiftUiOtherBasicsViewModel: Factory<SwiftUiOtherBasicsViewModel> {
        Factory(self) { SwiftUiOtherBasicsViewModel() }
    }

    @MainActor
    var swiftUiBackgroundTaskViewModel: Factory<SwiftUiBackgroundTaskViewModel> {
        Factory(self) { SwiftUiBackgroundTaskViewModel() }
    }

    @MainActor
    var swiftUiNotificationCenterViewModel: Factory<SwiftUiNotificationCenterViewModel> {
        Factory(self) { SwiftUiNotificationCenterViewModel() }
    }

    @MainActor
    var swiftUiNotificationViewModel: Factory<SwiftUiNotificationViewModel> {
        Factory(self) { SwiftUiNotificationViewModel() }
    }

    // MARK: - Core Architecture & System Features
    @MainActor
    var apiHandlingViewModel: Factory<ApiHandlingViewModel> {
        Factory(self) { ApiHandlingViewModel() }
    }

    @MainActor
    var postViewModel: Factory<PostViewModel> {
        Factory(self) {
            PostViewModel(
                fetchPostsUseCase: self.fetchPostsUseCase()
            )
        }.scope(.singleton)
    }


    @MainActor
    var databaseHandlingViewModel: Factory<DatabaseHandlingViewModel> {
        Factory(self) { DatabaseHandlingViewModel() }
    }

    @MainActor
    var architectureViewModel: Factory<ArchitectureViewModel> {
        Factory(self) { ArchitectureViewModel() }
    }
    
    @MainActor
    var dependencyInjectionViewModel: Factory<DependencyInjectionViewModel> {
        Factory(self) { DependencyInjectionViewModel() }
    }

    @MainActor
    var dependencyManagementViewModel: Factory<DependencyManagementViewModel> {
        Factory(self) { DependencyManagementViewModel() }
    }

    @MainActor
    var deploymentViewModel: Factory<DeploymentViewModel> {
        Factory(self) { DeploymentViewModel() }
    }

    @MainActor
    var bestPracticesViewModel: Factory<BestPracticesViewModel> {
        Factory(self) { BestPracticesViewModel() }
    }

    // MARK: - Fallbacks
    @MainActor
    var pageNotFoundViewModel: Factory<PageNotFoundViewModel> {
        Factory(self) { PageNotFoundViewModel() }
    }

}
