# Devlog — IosDevelopersGuide

Append-only archive for agentic_development.md (hook-exempt bookkeeping; archived, not deleted).

## 2026-10-24 — AI-section cleanup archive

### Architectural decisions (original text; superseded by the compressed `## Current state` — same rules, tighter wording)

## Architectural decisions

- **project.pbxproj (critical for any new file)** — the main app target does **not**
  use file-system-synchronized groups (only `IosDevelopersGuideTests` does). Every
  new `.swift` file must be registered explicitly: PBXBuildFile + PBXFileReference +
  PBXGroup membership + Sources build phase. Use unique 24-hex UUIDs prefixed
  `FF0000` (e.g. `FF000000000000000000002A`…) — grep `FF0000` in the pbxproj first
  to find the highest used and continue from there. Mirror an existing screen's
  registration exactly (e.g. grep `About` / `ExceptionHandling`).

- **Theming** — `ThemeManager` (UI/DesignSystem) owns persisted appearance
  (`@AppStorage("app.appearance")`, `Appearance { system, light, dark }`); it is a
  `@StateObject` in `RootView` and applied via `.preferredColorScheme(_:)`.
  `DesignSystem` (an `ObservableObject`, injected app-wide as `@EnvironmentObject`)
  rebuilds its `ColorScheme` from the *resolved* scheme on appear /
  `onChange(of: colorScheme)`. `ColorScheme` takes an explicit `isDark: Bool` (or a
  `SwiftUI.ColorScheme`); the old `UITraitCollection`-reading init was removed.
  Toggle lives in the shared app bar (next bullet).

- **Shared app bar + drawer in `PageScaffold`** — every screen uses `PageScaffold`,
  which bakes in the `.topBarTrailing` toolbar: theme toggle (`sun.max`/`moon`) and
  drawer button (`line.3.horizontal`). `DrawerState` (UI/Navigation, `@StateObject`
  in RootView) drives `AppDrawer`, rendered once as an overlay on the
  `NavigationStack` (dimmed backdrop, trailing-edge slide-in).

- **Design-system tokens** (`DesignSystem` / `ColorScheme`) — colour tokens:
  `primary`, `primaryVariant`, `secondary`, `background`, `surface`,
  `surfaceVariant`, `surfaceTint`, `outline`, `error`, `info`, `warning`,
  `critical`, + matching `on*` contrasts. `severity(_:)` / `onSeverity(_:)` map the
  `FailureSeverity` enum (Core) to info/warning/critical. Typography: `FontScheme`
  (`types`) — display/headline/title/body/label × Large/Medium/Small, Montserrat.
  `Sizes` spacing (xxs…xxl) **and** a radius scale: `radiusSm` 8, `radiusMd` 12,
  `radiusLg` 16, `radiusPill` 999. Shadows via `designSystemShadow(for:)` (routes on
  `DesignSystem.shadows`; the View extension inlines the values, keep in lockstep).

- **Reusable primitives** (`UI/Components/`) — the page hierarchy is
  section → group → text/code/example:
  - `SectionWrapper(_ title:)` — titled, bordered, `surfaceTint` block with a
    primary accent bar. Outer element for reference/teaching screens.
  - `ContentGroup(_ label:)` — uppercase overline sub-label, used inside a section.
  - `TextBlock(_ text:)` — narrative paragraph (`bodyLarge`/`onSurface`).
  - `CodeBlock(code:language:)` — standalone monospaced listing
    (`surfaceVariant`/`outline`/`radiusMd`). (A code display is also embedded in
    `CustomSection`'s `DisclosureGroup`, left coupled.)
  - `Links` — the home navigation card grid. `ErrorBanner`/`ErrorSnackbar`,
    `CustomSection`, `PageScaffold` round out the shared chrome.

- **Token discipline** — real screens must read fonts/colours/radii from
  `DesignSystem`; no `.font(.system(size:))`, `Color.black/.blue/…`, or literal
  `.cornerRadius(N)` in app screens. **Exception:** the `UI/Screens/SwiftUi/`
  tutorial tree keeps raw `Color.*` as **demo content** (it teaches SwiftUI colours
  on screen) — each such file is annotated `// intentional:`. Monospaced code fonts
  (`.system(size:, design: .monospaced)`) and conventional scrims
  (`Color.black.opacity(0.4)`) are also acceptable.

- **Screen conventions** (mirror `AboutView` / `ArchitectureView` / the
  `ExceptionHandling` screen) — a screen = `XxxView` + `XxxViewModel`
  (`@MainActor ObservableObject`, Factory-registered `.singleton`, injected
  `viewModelLogger` like `aboutViewModel`). Wire-up checklist: add the case + a
  destination built like `.about` in `Router`; add a card in `HomeViewModel` (with a
  one-line `description`); register the VM in `ViewModelModule`. Scaffold with
  `PageScaffold(pageTitle:)` + `VStack(spacing: .lg)` (`.horizontal .md` / `.bottom
  .xl` padding), and provide the full `environmentObject` set in `#Preview`. Static
  reference/teaching screens use `SectionWrapper`; `AboutView` keeps its own layout.

- **Home grid** — `LinkData` (Domain/Models) carries `title`, `routePath`,
  `description`. `Links` renders it as surface navigation cards in a responsive
  `LazyVGrid` (1 col compact / 2 regular / 3 regular ≥1024pt). Home title is
  "iOS Developer's Guide".
