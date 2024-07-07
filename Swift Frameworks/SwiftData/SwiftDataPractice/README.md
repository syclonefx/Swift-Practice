## SwiftDataPractice
[https://developer.apple.com/documentation/swiftdata](https://developer.apple.com/documentation/swiftdata)   
iOS 17.0+ 
This is a project to learn SwiftData   

Setting up preview to work with SwiftData
```swift
#Preview {
  do {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: User.self, configurations: config)
    let example = User(name: "Steve Jobs", emailAddress: "steve@apple.com", role: .admin)
    return NavigationStack {
      UserDetailsView(user: example)
        .modelContainer(container)
    }
  } catch {
    return Text("Failed to create preview: \(error.localizedDescription)")
  }
}
```
Preview has to have its own **ModelConfiguration** that is setup tp store in memory only and it needs a **ModelContainer** that uses the **ModelConfiguration**.

```swift
let config = ModelConfiguration(isStoredInMemoryOnly: true)
let container = try ModelContainer(for: User.self, configurations: config)
```

After adding the **ModelConfiguration** and the **ModelContainer**. Add the **.modelContainer(container)** modifier to the view.

```swift
UserDetailsView(user: example)
        .modelContainer(container)
```
