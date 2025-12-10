# get_post_view Brick - Quick Reference

## Overview
The `get_post_view` brick combines both GET and POST functionality in a single feature, following the same clean architecture structure as the separate `get_view` and `post_view` bricks.

## Usage
```bash
mason make get_post_view --name <FeatureName> --module <ModuleName>
```

## What's Included

### 1. **Two Use Cases**
   - **Fetch{Name}Usecase**: For GET operations (fetching data)
   - **{Name}Usecase**: For POST operations (submitting data)

### 2. **Two Events**
   - **{Name}FetchEvent**: Triggers GET request
   - **{Name}SubmitEvent**: Triggers POST request

### 3. **Dual Data Sources**
   Both methods in the datasource:
   - `fetch{Name}()`: Uses `client.get()` with query parameters
   - `{Name}()`: Uses `client.post()` with request body

### 4. **Complete Architecture**
   - ✅ Data Layer: Datasources, Models, Repositories
   - ✅ Domain Layer: Use Cases, Facades, Repositories
   - ✅ Presentation Layer: BLoC, Events, States, Views
   - ✅ Dependency Injection: All dependencies registered

## Key Differences from Separate Bricks

| Feature | get_view | post_view | get_post_view |
|---------|----------|-----------|---------------|
| GET Method | ✓ | ✗ | ✓ |
| POST Method | ✗ | ✓ | ✓ |
| Use Cases | 1 (fetch) | 1 (submit) | 2 (fetch + submit) |
| Events | FetchEvent | SubmitEvent | Both |
| HTTP Methods | GET only | POST only | GET + POST |

## Example Usage in Code

### Fetching Data (GET)
```dart
context.read<UserBloc>().add(UserFetchEvent(UserParams()));
```

### Submitting Data (POST)
```dart
context.read<UserBloc>().add(UserSubmitEvent(userData));
```

## When to Use

Use `get_post_view` when:
- Your feature needs both read and write operations
- You want to manage related GET and POST operations in a single BLoC
- You need to fetch data and then submit updates

Use separate bricks when:
- You only need one operation type
- You want to keep features completely isolated
