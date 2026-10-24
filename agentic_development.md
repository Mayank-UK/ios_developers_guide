# AI defined section:

## Current state

SwiftUI layered app (Core/Data/Domain/DI/UI), Factory DI, Router-driven NavigationStack, ViewModel-per-screen. Home title "iOS Developer's Guide".

- **pbxproj (critical for any new file)** — the main app target does NOT use file-system-synchronized groups
  (only IosDevelopersGuideTests does). Every new `.swift` file must be registered explicitly: PBXBuildFile +
  PBXFileReference + PBXGroup membership + Sources build phase. UUIDs: unique 24-hex prefixed `FF0000`
  (e.g. `FF000000000000000000002A`…) — grep `FF0000` in the pbxproj first to find the highest used and
  continue from there; mirror an existing screen's registration exactly (grep `About` / `ExceptionHandling`).
- **Theming** — `ThemeManager` (UI/DesignSystem) owns persisted appearance (`@AppStorage("app.appearance")`,
  `Appearance { system, light, dark }`); `@StateObject` in `RootView`, applied via `.preferredColorScheme(_:)`.
  `DesignSystem` (an ObservableObject, injected app-wide as `@EnvironmentObject`) rebuilds its `ColorScheme`
  from the *resolved* scheme on appear / `onChange(of: colorScheme)`. `ColorScheme` takes an explicit
  `isDark: Bool` (or a `SwiftUI.ColorScheme`); the old `UITraitCollection`-reading init was removed. Toggle
  lives in the shared app bar.
- **App bar + drawer** — every screen uses `PageScaffold`, which bakes in the `.topBarTrailing` toolbar:
  theme toggle (`sun.max`/`moon`) and drawer button (`line.3.horizontal`). `DrawerState` (UI/Navigation,
  `@StateObject` in RootView) drives `AppDrawer`, rendered once as an overlay on the `NavigationStack`
  (dimmed backdrop, trailing-edge slide-in).
- **Design tokens** (`DesignSystem` / `ColorScheme`) — colour tokens: `primary`, `primaryVariant`, `secondary`,
  `background`, `surface`, `surfaceVariant`, `surfaceTint`, `outline`, `error`, `info`, `warning`, `critical`
  + matching `on*` contrasts. `severity(_:)` / `onSeverity(_:)` map the `FailureSeverity` enum (Core) to
  info/warning/critical. Typography: `FontScheme` (`types`) — display/headline/title/body/label ×
  Large/Medium/Small, Montserrat. `Sizes`: spacing xxs…xxl **and** a radius scale `radiusSm` 8 / `radiusMd` 12 /
  `radiusLg` 16 / `radiusPill` 999. Shadows via `designSystemShadow(for:)` (routes on `DesignSystem.shadows`;
  the View extension inlines the values — keep in lockstep).
- **Reusable primitives** (`UI/Components/`) — page hierarchy is section → group → text/code/example:
  `SectionWrapper(_ title:)` (titled, bordered, `surfaceTint` block with a primary accent bar — outer element
  for reference/teaching screens) · `ContentGroup(_ label:)` (uppercase overline sub-label) · `TextBlock(_
  text:)` (narrative paragraph, `bodyLarge`/`onSurface`) · `CodeBlock(code:language:)` (standalone monospaced
  listing; a code display is also embedded in `CustomSection`'s `DisclosureGroup` — left coupled). `Links` =
  the home navigation card grid; `ErrorBanner`/`ErrorSnackbar`, `CustomSection`, `PageScaffold` round out the
  shared chrome.
- **Token discipline** — real screens must read fonts/colours/radii from `DesignSystem`; no
  `.font(.system(size:))`, `Color.black/.blue/…`, or literal `.cornerRadius(N)` in app screens. **Exception:**
  the `UI/Screens/SwiftUi/` tutorial tree keeps raw `Color.*` as **demo content** (each such file annotated
  `// intentional:`); monospaced code fonts (`.system(size:, design: .monospaced)`) and conventional scrims
  (`Color.black.opacity(0.4)`) are also acceptable.
- **Screen conventions** (mirror `AboutView` / `ArchitectureView` / `ExceptionHandling`) — a screen =
  `XxxView` + `XxxViewModel` (`@MainActor ObservableObject`, Factory-registered `.singleton`, injected
  `viewModelLogger` like `aboutViewModel`). Wire-up checklist: Router case + destination built like `.about`;
  card in `HomeViewModel` (with a one-line `description`); VM registered in `ViewModelModule`. Scaffold with
  `PageScaffold(pageTitle:)` + `VStack(spacing: .lg)` (`.horizontal .md` / `.bottom .xl` padding); full
  `environmentObject` set in `#Preview`. Static reference/teaching screens use `SectionWrapper`; `AboutView`
  keeps its own layout.
- **Home grid** — `LinkData` (Domain/Models) carries `title`, `routePath`, `description`; `Links` renders it
  as surface navigation cards in a responsive `LazyVGrid` (1 col compact / 2 regular / 3 regular ≥1024pt).

## Active tasks

- Deferred (low priority, from the completed 10/10 review): deeper UIKit-screen review; broader
  view-model/UI test coverage.

# Developer defined section

- Project requirements
    - I will add my requirements to this file marked as "⏳" and you will keep finishing them and marking them "✅" on completion

- Generic instructions:
    - You have to build UI using the design system implemented in the application
    - You have to follow the proper architecture that is followed in the application, for example, having use cases, repositories, repositoriesImpl, remote, DTOs, local, DAOs, exception handling, and so on
    - You have to check if existing components can be reused instead of creating new ones. If a component is to be used in a single file, then better to make it a function inside that view. If a component is to be used in multiple files, then create it inside the global ui/components
    - If feeling confused about how to do things, you are free to check how it's done in other parts of this app; the goal is to maintain consistency throughout the app
    - You have to follow few principles to write quality code, but these are not to be forced as some technologies have their standards, for example react uses hooks and other technologies use their own standards:
        - Core programming principles:
            - DRY, KISS, YAGNI, SOLID, Separation of concerns, Single source of truth
        - Object oriented design if required
            - Encapsulation, Abstraction, Inheritance, Polymorphism, Composition over inheritance, Command query separation, Law of Demeter, Dependency Injection, Inversion of control, High cohesion, Low coupling
        - Software design
            - Modularity, Maintainability, Readibility, Extensibility, Defensive programming (input is hostile), Immutability, Pure functions, Referential Transparency, Composition, Lazy evaluation
        - Code quality
            - Self documenting (descriptive naming), Consistent formatting, Error handling
        - Concurrency
            - Thread safety, Synchronization, Immutability
        - Security
            - Least priviledge, Input validation, Secret management
        - Testing
            - Unit tests, Test behaviour not implementation
        - Refactoring
            - Incremental refactoring, remove duplication
        - Engineering principles
            - Unix philosophy (composable tools beat monoliths)
        - Performance
            - Right algorithms, Right datastructures, Caching, Batching
    - You have to follow ios best practices:
        -
    - Keep "agentic_development.md" for this project as lean as possible without compromising it's primary purpose to high quality consistent development, optimize token efficiency and seemless development across sessions. Remove the information inside the "AI defined section" that is no longer relevant and will not be usefull in future to save tokens

- Development tasks:
    - Update design similar to React developers guide ✅
        - Added missing tokens (outline, surfaceVariant/Tint, severity colours, radius scale), fixed the `designSystemShadow` bug, added shared primitives (SectionWrapper/ContentGroup/TextBlock/CodeBlock), rebuilt the home grid as responsive cards with descriptions, and swept hardcoded fonts/colours/radii across all app screens to tokens.
    - react_developers_guide is well descriptive, but the ios one is not, we need to describe little more ✅
        - Rewrote Architecture to document this app's real layers (was an Android/.kt copy), added a new Exception-handling screen teaching the typed error model, and raised Swift/iOS fundamentals to narrative prose matching About/Architecture.
    - Add a drawer with about page and add toggle for light/dark mode in appbar on right side like react_developers_guide ✅
    - Review code and refactor to take implementation to 10/10 ✅ (clean build = 0 warnings; full test suite green)
        - Review from the perspective of a developer who has 10 years of experience in ios and 30 years of experience in Software development, who knows all the best practices and bad practices, whose code is simple to understand yet robust
        - Review how architecture is implemented ✅ (Architecture screen rewritten against the real layers; Core/Data/Domain/DI structure sound)
        - Review how design system is implemented ✅ (tokens + primitives + token-discipline sweep done; all pre-existing warnings resolved — removed the dead `Result.capturing` extension that caused the `SafeRepositoryCall` generic-shadow warning, modernised `ErrorSnackbar`'s deprecated `onChange`)
        - Review how hook files and logic inside them are implemented, if this is even standard or just spaghetti code — N/A for iOS (hooks are a React concept; the iOS equivalents are ViewModels + the Factory/DI/UseCase/Repository layers, already reviewed above)
        - Review all other aspects ✅ — senior pass applied safe fixes: collapsed a no-op if/else in `ExceptionMapper`, removed a force-unwrap in `textValidator`, fixed SwiftUI form snippets that interpolated live values instead of showing literal `\(...)` code, and added `ExceptionMapper` unit tests. Open/deferred (low priority): deeper UIKit-screen review, broader view-model/UI test coverage.
