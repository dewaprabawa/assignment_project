# assignment_project

A Flutter project showcasing the implementation of Clean Architecture principles.

![Screenshot](Screenshot%202023-11-24%20at%2012.03.07.png)

## Download APK
[Download the APK](https://drive.google.com/file/d/1GGK8ifLHi78hQdLWw9JOWQBuj2Y0t9hU/view?usp=sharing)


## Clean Architecture Overview

Clean Architecture is a software design philosophy that promotes separation of concerns and maintainability by organizing code into distinct layers. The key components of Clean Architecture are:

1. **Entities:** Represent the business logic and core functionality of the application. These are independent of any external framework.

2. **Use Cases (Interactors):** Contain application-specific business rules. They coordinate the flow of data between entities and the external world.

3. **Repositories:** Abstract interfaces for data sources. They provide a bridge between use cases and the external data sources such as databases, APIs, etc.

4. **Frameworks and Drivers:** External frameworks, tools, and libraries. They include UI, database, web frameworks, etc. In Flutter, this would include the Flutter framework itself.

5. **Dependency Rule:** Dependencies flow inwards. The inner layers (Entities, Use Cases, Repositories) should not depend on the outer layers. This allows for flexibility, testability, and independence of the core business logic.

## Project Structure

The project follows the Clean Architecture principles with the following directory structure:

- **lib/core:** Contains the core business logic, including entities and use cases.

- **lib/data:** Implements repositories that interact with external data sources.

- **lib/features:** Houses the presentation layer, including UI components and their respective business logic.

- **lib/injection:** Manages dependency injection using a framework like `get_it` or `provider`.

- **test:** Contains unit and integration tests for the application.

## Getting Started

This project serves as a starting point for Flutter applications following Clean Architecture principles. It demonstrates how to structure your code for better maintainability, testability, and separation of concerns.

To run the project, follow the standard Flutter procedures:

1. Clone the repository.
2. Navigate to the project directory.
3. Run `flutter pub get` to fetch dependencies.
4. Run the application using `flutter run`.

For more information on Clean Architecture and Flutter development, refer to the [online documentation](https://docs.flutter.dev/) and relevant resources.

Feel free to explore, modify, and build upon this project to suit your specific requirements.
