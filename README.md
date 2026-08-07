# niveussolutions

A new Flutter project.

## Getting Started

# Flutter Data Table Application

## Application Architecture

The application follows a layered architecture to separate UI, business logic, and data access.

```
Presentation (Flutter Widgets)
        │
        ▼
GetX Controller
        │
        ▼
Repository
        │
        ▼
API Service
        │
        ▼
REST API
```

### Layers

* **Presentation Layer**

    * Flutter widgets
    * Responsive layouts
    * Data table
    * Search and filtering UI

* **Business Layer**

    * GetX Controllers
    * Sorting
    * Searching
    * Filtering
    * Loading/Error state management

* **Data Layer**

    * Repository pattern
    * HTTP API calls
    * JSON parsing
    * Model mapping

---

# State Management

The application uses **GetX**.

Reactive variables (`Rx`) manage:

* Loading state
* API state
* Search text
* Selected language
* Sorting order
* Selected column
* Filtered records

API states include:

* Initial
* Loading
* Success
* Empty
* Error

---

# Table Rendering Strategy

The table is rendered using:

* `ListView.builder`
* Lazy loading of visible rows
* Reactive updates using `Obx`

Only visible rows are built, reducing memory usage for large datasets.

---

# Search Implementation

Search is implemented using:

* Case-insensitive matching
* Name
* ID

Search updates the filtered list without modifying the original dataset.

Search uses:

```
contains()
```

with lowercase comparison.

---

# Debounce Strategy

A debounce of **300 ms** is applied before executing search.

Benefits:

* Reduces unnecessary filtering
* Improves typing performance
* Prevents multiple UI rebuilds

---

# Dropdown Implementation

The language selector uses a searchable dropdown.

Features include:

* Search inside dropdown
* Single selection
* Clear selection
* "All Languages" option
* No-results state
* Loading indicator
* Keyboard navigation (where supported)

Unique languages are extracted from the API response and sorted alphabetically.

---

# Sorting Implementation

Sorting supports:

* Name
* Language
* ID
* Version

Sorting behavior:

* First click → Ascending
* Second click → Descending

The selected column displays a sort indicator.

---

# Error Handling

The application handles:

* Slow network
* Network timeout
* No Internet connection
* Invalid JSON
* Empty response
* API failure
* Retry mechanism

Appropriate loading indicators and user-friendly messages are displayed for each state.

---

# Accessibility Considerations

* Search field supports keyboard input.
* Dropdown supports keyboard navigation.
* Buttons include clear labels.
* Adequate spacing and touch targets are maintained.
* Loading and empty states provide user feedback.

---

# Known Limitations

* Entire dataset is loaded before client-side filtering.
* Sorting is performed on the client.
* No pagination or infinite scrolling.
* Search currently supports Name and ID only.

---

# Performance Trade-offs

Advantages:

* Fast client-side search
* Fast sorting
* Responsive filtering
* Simple architecture

Trade-offs:

* Higher memory usage for very large datasets.
* Initial load time increases with dataset size.
* Client-side processing may become expensive for extremely large datasets (>100k records).

Future improvements could include:

* Server-side pagination
* Server-side search
* Virtual scrolling
* Incremental JSON parsing
* Local caching

