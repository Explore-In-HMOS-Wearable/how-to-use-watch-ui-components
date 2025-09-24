> **Note:** To access all shared projects, get information about environment setup, and view other guides, please visit [Explore-In-HMOS-Wearable Index](https://github.com/Explore-In-HMOS-Wearable/hmos-index).

# How to Use Watch UI Components

This codelab showcases the comprehensive usage of HarmonyOS ArkTS-based wearable UI components:

- `ArcButton`: Circular button with style modes, font customization, and shadow.
- `ArcSlider`: Circular slider with layout and style configuration.
- `ArcScrollBar`: Adds circular scrollbar to scrollable content.
- `ArcList` & `ArcListItem`: Circular list views with scroll snapping and item scaling.
- `ArcAlphabetIndexer`: A to Z quick navigation index integrated with `ArcList`.
- `ArcSwiper`: A horizontal circular swiper component with dot indicator and animations.

All components are used with their full `Options` objects, demonstrating real-world styling and interaction usage.

# Preview

<div>
  <img src="./screenshots/arc_alphabet_indexer.gif" width="24%">
  <img src="./screenshots/arc_list.gif" width="24%">
  <img src="./screenshots/arc_slider.gif" width="24%">
  <img src="./screenshots/arc_swiper.gif" width="24%">
</div>

# Use Cases

- Interactive buttons with styles and shadows `ArcButton`
- Adjustable circular sliders for values like brightness or volume `ArcSlider`
- Scrollable content with arc scrollbar feedback `ArcScrollBar`
- Circular lists with snapping and scaling effects `ArcList`, `ArcListItem`
- Quick A–Z navigation in lists `ArcAlphabetIndexer`
- Swipeable circular pages with indicators `ArcSwiper`

# Tech Stack

- **Languages**: ArkTS
- **Frameworks**: HarmonyOS SDK 5.1.0(18)
- **Tools**: DevEco Studio Version 5.1.0.828
- **Libraries**:
    - `@kit.ArkUI`
    - `@kit.AbilityKit`
    - `@kit.PerformanceAnalysisKit`

# Directory Structure

````
entry/src/main/ets/
|---pages/
|   |---ArcAlphabetIndexerPage.ets     // Demo page for ArcAlphabetIndexer component
|   |---ArcButtonPage.ets              // Demo page for ArcButton component
|   |---ArcListPage.ets                // Demo page for ArcList and ArcListItem components
|   |---ArcScrollBarPage.ets           // Demo page for ArcScrollBar component
|   |---ArcSliderPage.ets              // Demo page for ArcSlider component
|   |---ArcSwiperPage.ets              // Demo page for ArcSwiper component
|   |---HomeContent.ets                // Home content with navigation buttons
|   |---Index.ets                      // Main entry page
````

# Constraints and Restrictions

## Supported Devices

- Huawei Watch 5

# License

**How to Use Watch UI Components** is distributed under the terms of the MIT License.
See the [license](/LICENSE) for more information.