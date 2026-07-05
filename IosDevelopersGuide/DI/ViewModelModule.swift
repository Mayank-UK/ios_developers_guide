//
//  ViewModelModule.swift
//  IosDevelopersGuide
//

import FactoryKit

extension Container {

    @MainActor
    var homeViewModel: Factory<HomeViewModel> {
        /// Scoped and singleton — only one single instance for all injections
        Factory(self) { HomeViewModel(logger: self.viewModelLogger()) }.scope(.singleton)
    }

    @MainActor
    var iosFundamentalsViewModel: Factory<IosFundamentalsViewModel> {
        Factory(self) { IosFundamentalsViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftFundamentalsViewModel: Factory<SwiftFundamentalsViewModel> {
        Factory(self) { SwiftFundamentalsViewModel() }.scope(.singleton)
    }

    // MARK: - SwiftUI Core & Concepts
    @MainActor
    var swiftUiViewModel: Factory<SwiftUiViewModel> {
        Factory(self) { SwiftUiViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiManipulationViewModel: Factory<SwiftUiManipulationViewModel> {
        Factory(self) { SwiftUiManipulationViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiLifeCycleViewModel: Factory<SwiftUiLifeCycleViewModel> {
        Factory(self) { SwiftUiLifeCycleViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiNavigationAndRoutingViewModel: Factory<SwiftUiNavigationAndRoutingViewModel> {
        Factory(self) { SwiftUiNavigationAndRoutingViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiStateManagementViewModel: Factory<SwiftUiStateManagementViewModel> {
        Factory(self) { SwiftUiStateManagementViewModel() }.scope(.singleton)
    }

    // MARK: - SwiftUI Advanced & Tooling
    @MainActor
    var swiftUiCatalogViewModel: Factory<SwiftUiCatalogViewModel> {
        Factory(self) { SwiftUiCatalogViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiDebuggingViewModel: Factory<SwiftUiDebuggingViewModel> {
        Factory(self) { SwiftUiDebuggingViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiTestingViewModel: Factory<SwiftUiTestingViewModel> {
        Factory(self) { SwiftUiTestingViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiSupportingClassesAndEnumsViewModel: Factory<SwiftUiSupportingClassesAndEnumsViewModel> {
        Factory(self) { SwiftUiSupportingClassesAndEnumsViewModel() }.scope(.singleton)
    }

    // MARK: - Native Features Handling
    @MainActor
    var swiftUiNativeFeaturesViewModel: Factory<SwiftUiNativeFeaturesViewModel> {
        Factory(self) { SwiftUiNativeFeaturesViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUICameraViewModel: Factory<SwiftUICameraViewModel> {
        Factory(self) { SwiftUICameraViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUIFaceIdViewModel: Factory<SwiftUIFaceIdViewModel> {
        Factory(self) { SwiftUIFaceIdViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiMicrophoneViewModel: Factory<SwiftUiMicrophoneViewModel> {
        Factory(self) { SwiftUiMicrophoneViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiSpeakersViewModel: Factory<SwiftUiSpeakersViewModel> {
        Factory(self) { SwiftUiSpeakersViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiBluetoothViewModel: Factory<SwiftUiBluetoothViewModel> {
        Factory(self) { SwiftUiBluetoothViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiWifiViewModel: Factory<SwiftUiWifiViewModel> {
        Factory(self) { SwiftUiWifiViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCompassViewModel: Factory<SwiftUiCompassViewModel> {
        Factory(self) { SwiftUiCompassViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiAccelerometerViewModel: Factory<SwiftUiAccelerometerViewModel> {
        Factory(self) { SwiftUiAccelerometerViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiProximitySensorViewModel: Factory<SwiftUiProximitySensorViewModel> {
        Factory(self) { SwiftUiProximitySensorViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiAmbientLightSensorViewModel: Factory<SwiftUiAmbientLightSensorViewModel> {
        Factory(self) { SwiftUiAmbientLightSensorViewModel() }.scope(.singleton)
    }
    
    // MARK: - Design & Layout
    @MainActor
    var swiftUiDesignSystemViewModel: Factory<SwiftUiDesignSystemViewModel> {
        Factory(self) { SwiftUiDesignSystemViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiResponsiveDesignViewModel: Factory<SwiftUiResponsiveDesignViewModel> {
        Factory(self) { SwiftUiResponsiveDesignViewModel() }.scope(.singleton)
    }
    
    @MainActor
    var swiftUiLayoutViewModel: Factory<SwiftUiLayoutViewModel> {
        Factory(self) { SwiftUiLayoutViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiPageLayoutViewModel: Factory<SwiftUiPageLayoutViewModel> {
        Factory(self) { SwiftUiPageLayoutViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiBasicLayoutViewModel: Factory<SwiftUiBasicLayoutViewModel> {
        Factory(self) { SwiftUiBasicLayoutViewModel() }.scope(.singleton)
    }

    // MARK: - Dimensions, Styling & Layout Details
    @MainActor
    var swiftUiDimensionsAndConstraintsViewModel: Factory<SwiftUiDimensionsAndConstraintsViewModel> {
        Factory(self) { SwiftUiDimensionsAndConstraintsViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiSpacingViewModel: Factory<SwiftUiSpacingViewModel> {
        Factory(self) { SwiftUiSpacingViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiColorsAndBackgroundsViewModel: Factory<SwiftUiColorsAndBackgroundsViewModel> {
        Factory(self) { SwiftUiColorsAndBackgroundsViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiAlignmentViewModel: Factory<SwiftUiAlignmentViewModel> {
        Factory(self) { SwiftUiAlignmentViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiTextViewModel: Factory<SwiftUiTextViewModel> {
        Factory(self) { SwiftUiTextViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiBordersViewModel: Factory<SwiftUiBordersViewModel> {
        Factory(self) { SwiftUiBordersViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiIconsAndImagesViewModel: Factory<SwiftUiIconsAndImagesViewModel> {
        Factory(self) { SwiftUiIconsAndImagesViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiEffectsViewModel: Factory<SwiftUiEffectsViewModel> {
        Factory(self) { SwiftUiEffectsViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiPositioningViewModel: Factory<SwiftUiPositioningViewModel> {
        Factory(self) { SwiftUiPositioningViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiVisibilityViewModel: Factory<SwiftUiVisibilityViewModel> {
        Factory(self) { SwiftUiVisibilityViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiInteractiveBehavioursViewModel: Factory<SwiftUiInteractiveBehavioursViewModel> {
        Factory(self) { SwiftUiInteractiveBehavioursViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiWebAndAppsViewModel: Factory<SwiftUiWebAndAppsViewModel> {
        Factory(self) { SwiftUiWebAndAppsViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiFormViewModel: Factory<SwiftUiFormViewModel> {
        Factory(self) { SwiftUiFormViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiMediaViewModel: Factory<SwiftUiMediaViewModel> {
        Factory(self) { SwiftUiMediaViewModel() }.scope(.singleton)
    }

    // MARK: - Catalog Controls
    @MainActor
    var swiftUiCatalogControlsViewModel: Factory<SwiftUiCatalogControlsViewModel> {
        Factory(self) { SwiftUiCatalogControlsViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogButtonsViewModel: Factory<SwiftUiCatalogButtonsViewModel> {
        Factory(self) { SwiftUiCatalogButtonsViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogToggleViewModel: Factory<SwiftUiCatalogToggleViewModel> {
        Factory(self) { SwiftUiCatalogToggleViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogTextFieldViewModel: Factory<SwiftUiCatalogTextFieldViewModel> {
        Factory(self) { SwiftUiCatalogTextFieldViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogTextEditorViewModel: Factory<SwiftUiCatalogTextEditorViewModel> {
        Factory(self) { SwiftUiCatalogTextEditorViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogSecureFieldViewModel: Factory<SwiftUiCatalogSecureFieldViewModel> {
        Factory(self) { SwiftUiCatalogSecureFieldViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogSliderViewModel: Factory<SwiftUiCatalogSliderViewModel> {
        Factory(self) { SwiftUiCatalogSliderViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogPickersViewModel: Factory<SwiftUiCatalogPickersViewModel> {
        Factory(self) { SwiftUiCatalogPickersViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogStepperViewModel: Factory<SwiftUiCatalogStepperViewModel> {
        Factory(self) { SwiftUiCatalogStepperViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogMenusViewModel: Factory<SwiftUiCatalogMenusViewModel> {
        Factory(self) { SwiftUiCatalogMenusViewModel() }.scope(.singleton)
    }

    // MARK: - Catalog Display Elements
    @MainActor
    var swiftUiCatalogDisplayElementsViewModel: Factory<SwiftUiCatalogDisplayElementsViewModel> {
        Factory(self) { SwiftUiCatalogDisplayElementsViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogTextViewModel: Factory<SwiftUiCatalogTextViewModel> {
        Factory(self) { SwiftUiCatalogTextViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogImageViewModel: Factory<SwiftUiCatalogImageViewModel> {
        Factory(self) { SwiftUiCatalogImageViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogLinkViewModel: Factory<SwiftUiCatalogLinkViewModel> {
        Factory(self) { SwiftUiCatalogLinkViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogWebViewModel: Factory<SwiftUiCatalogWebViewModel> {
        Factory(self) { SwiftUiCatalogWebViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogLabelViewModel: Factory<SwiftUiCatalogLabelViewModel> {
        Factory(self) { SwiftUiCatalogLabelViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogProgressViewModel: Factory<SwiftUiCatalogProgressViewModel> {
        Factory(self) { SwiftUiCatalogProgressViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogGaugeViewModel: Factory<SwiftUiCatalogGaugeViewModel> {
        Factory(self) { SwiftUiCatalogGaugeViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogContentUnavailableViewModel: Factory<SwiftUiCatalogContentUnavailableViewModel> {
        Factory(self) { SwiftUiCatalogContentUnavailableViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogShapesViewModel: Factory<SwiftUiCatalogShapesViewModel> {
        Factory(self) { SwiftUiCatalogShapesViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogPathViewModel: Factory<SwiftUiCatalogPathViewModel> {
        Factory(self) { SwiftUiCatalogPathViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogCanvasViewModel: Factory<SwiftUiCatalogCanvasViewModel> {
        Factory(self) { SwiftUiCatalogCanvasViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogColorViewModel: Factory<SwiftUiCatalogColorViewModel> {
        Factory(self) { SwiftUiCatalogColorViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogGradientViewModel: Factory<SwiftUiCatalogGradientViewModel> {
        Factory(self) { SwiftUiCatalogGradientViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogSpacerViewModel: Factory<SwiftUiCatalogSpacerViewModel> {
        Factory(self) { SwiftUiCatalogSpacerViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogDividerViewModel: Factory<SwiftUiCatalogDividerViewModel> {
        Factory(self) { SwiftUiCatalogDividerViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogChartViewModel: Factory<SwiftUiCatalogChartViewModel> {
        Factory(self) { SwiftUiCatalogChartViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogMapViewModel: Factory<SwiftUiCatalogMapViewModel> {
        Factory(self) { SwiftUiCatalogMapViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogTableViewModel: Factory<SwiftUiCatalogTableViewModel> {
        Factory(self) { SwiftUiCatalogTableViewModel() }.scope(.singleton)
    }

    // MARK: - Catalog Layouts & Containers
    @MainActor
    var swiftUiCatalogLayoutsViewModel: Factory<SwiftUiCatalogLayoutsViewModel> {
        Factory(self) { SwiftUiCatalogLayoutsViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogStacksViewModel: Factory<SwiftUiCatalogStacksViewModel> {
        Factory(self) { SwiftUiCatalogStacksViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogListViewModel: Factory<SwiftUiCatalogListViewModel> {
        Factory(self) { SwiftUiCatalogListViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogForEachViewModel: Factory<SwiftUiCatalogForEachViewModel> {
        Factory(self) { SwiftUiCatalogForEachViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogGridsViewModel: Factory<SwiftUiCatalogGridsViewModel> {
        Factory(self) { SwiftUiCatalogGridsViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogNavigationStackViewModel: Factory<SwiftUiCatalogNavigationStackViewModel> {
        Factory(self) { SwiftUiCatalogNavigationStackViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogNavigationSplitViewModel: Factory<SwiftUiCatalogNavigationSplitViewModel> {
        Factory(self) { SwiftUiCatalogNavigationSplitViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogTabViewModel: Factory<SwiftUiCatalogTabViewModel> {
        Factory(self) { SwiftUiCatalogTabViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogScrollViewModel: Factory<SwiftUiCatalogScrollViewModel> {
        Factory(self) { SwiftUiCatalogScrollViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogGeometryReaderViewModel: Factory<SwiftUiCatalogGeometryReaderViewModel> {
        Factory(self) { SwiftUiCatalogGeometryReaderViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogBackgroundViewModel: Factory<SwiftUiCatalogBackgroundViewModel> {
        Factory(self) { SwiftUiCatalogBackgroundViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogOverlayViewModel: Factory<SwiftUiCatalogOverlayViewModel> {
        Factory(self) { SwiftUiCatalogOverlayViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogDisclosureGroupViewModel: Factory<SwiftUiCatalogDisclosureGroupViewModel> {
        Factory(self) { SwiftUiCatalogDisclosureGroupViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogOutlineGroupViewModel: Factory<SwiftUiCatalogOutlineGroupViewModel> {
        Factory(self) { SwiftUiCatalogOutlineGroupViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogToolbarViewModel: Factory<SwiftUiCatalogToolbarViewModel> {
        Factory(self) { SwiftUiCatalogToolbarViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogFrameViewModel: Factory<SwiftUiCatalogFrameViewModel> {
        Factory(self) { SwiftUiCatalogFrameViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogSafeAreaInsetViewModel: Factory<SwiftUiCatalogSafeAreaInsetViewModel> {
        Factory(self) { SwiftUiCatalogSafeAreaInsetViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogEmptyViewModel: Factory<SwiftUiCatalogEmptyViewModel> {
        Factory(self) { SwiftUiCatalogEmptyViewModel() }.scope(.singleton)
    }

    // MARK: - Catalog Containers (Part 2)
    @MainActor
    var swiftUiCatalogContainersViewModel: Factory<SwiftUiCatalogContainersViewModel> {
        Factory(self) { SwiftUiCatalogContainersViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogGroupViewModel: Factory<SwiftUiCatalogGroupViewModel> {
        Factory(self) { SwiftUiCatalogGroupViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogFormViewModel: Factory<SwiftUiCatalogFormViewModel> {
        Factory(self) { SwiftUiCatalogFormViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogSectionViewModel: Factory<SwiftUiCatalogSectionViewModel> {
        Factory(self) { SwiftUiCatalogSectionViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogViewThatFitsViewModel: Factory<SwiftUiCatalogViewThatFitsViewModel> {
        Factory(self) { SwiftUiCatalogViewThatFitsViewModel() }.scope(.singleton)
    }

    // MARK: - Catalog Modals & Overlays
    @MainActor
    var swiftUiCatalogModalsViewModel: Factory<SwiftUiCatalogModalsViewModel> {
        Factory(self) { SwiftUiCatalogModalsViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogAlertViewModel: Factory<SwiftUiCatalogAlertViewModel> {
        Factory(self) { SwiftUiCatalogAlertViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogConfirmationDialogViewModel: Factory<SwiftUiCatalogConfirmationDialogViewModel> {
        Factory(self) { SwiftUiCatalogConfirmationDialogViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogNotificationViewModel: Factory<SwiftUiCatalogNotificationViewModel> {
        Factory(self) { SwiftUiCatalogNotificationViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogSheetViewModel: Factory<SwiftUiCatalogSheetViewModel> {
        Factory(self) { SwiftUiCatalogSheetViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogInspectorViewModel: Factory<SwiftUiCatalogInspectorViewModel> {
        Factory(self) { SwiftUiCatalogInspectorViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiCatalogPopoverViewModel: Factory<SwiftUiCatalogPopoverViewModel> {
        Factory(self) { SwiftUiCatalogPopoverViewModel() }.scope(.singleton)
    }

    // MARK: - Miscellaneous, Widgets & System Services
    @MainActor
    var swiftUiCatalogMiscellaneousViewModel: Factory<SwiftUiCatalogMiscellaneousViewModel> {
        Factory(self) { SwiftUiCatalogMiscellaneousViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiWidgetViewModel: Factory<SwiftUiWidgetViewModel> {
        Factory(self) { SwiftUiWidgetViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiOtherBasicsViewModel: Factory<SwiftUiOtherBasicsViewModel> {
        Factory(self) { SwiftUiOtherBasicsViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiBackgroundTaskViewModel: Factory<SwiftUiBackgroundTaskViewModel> {
        Factory(self) { SwiftUiBackgroundTaskViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiNotificationCenterViewModel: Factory<SwiftUiNotificationCenterViewModel> {
        Factory(self) { SwiftUiNotificationCenterViewModel() }.scope(.singleton)
    }

    @MainActor
    var swiftUiNotificationViewModel: Factory<SwiftUiNotificationViewModel> {
        Factory(self) { SwiftUiNotificationViewModel() }.scope(.singleton)
    }

    // MARK: - Core Architecture & System Features
    @MainActor
    var apiHandlingViewModel: Factory<ApiHandlingViewModel> {
        Factory(self) { ApiHandlingViewModel() }.scope(.singleton)
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
        Factory(self) { DatabaseHandlingViewModel() }.scope(.singleton)
    }

    @MainActor
    var architectureViewModel: Factory<ArchitectureViewModel> {
        Factory(self) { ArchitectureViewModel() }.scope(.singleton)
    }
    
    @MainActor
    var dependencyInjectionViewModel: Factory<DependencyInjectionViewModel> {
        Factory(self) { DependencyInjectionViewModel() }.scope(.singleton)
    }

    @MainActor
    var dependencyManagementViewModel: Factory<DependencyManagementViewModel> {
        Factory(self) { DependencyManagementViewModel() }.scope(.singleton)
    }

    @MainActor
    var deploymentViewModel: Factory<DeploymentViewModel> {
        Factory(self) { DeploymentViewModel() }.scope(.singleton)
    }

    @MainActor
    var bestPracticesViewModel: Factory<BestPracticesViewModel> {
        Factory(self) { BestPracticesViewModel() }.scope(.singleton)
    }

    @MainActor
    var testingViewModel: Factory<TestingViewModel> {
        Factory(self) { TestingViewModel() }.scope(.singleton)
    }

    @MainActor
    var devEnvironmentViewModel: Factory<DevEnvironmentViewModel> {
        Factory(self) { DevEnvironmentViewModel() }.scope(.singleton)
    }

    @MainActor
    var loggingViewModel: Factory<LoggingViewModel> {
        Factory(self) { LoggingViewModel() }.scope(.singleton)
    }

    // MARK: - Fallbacks
    @MainActor
    var pageNotFoundViewModel: Factory<PageNotFoundViewModel> {
        Factory(self) { PageNotFoundViewModel() }.scope(.singleton)
    }

}
