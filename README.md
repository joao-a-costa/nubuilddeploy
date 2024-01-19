# NuBuildDeploy

Automate version updates, builds, and NuGet package deployment with this script. Ideal for projects using Git, NuGet, and MSBuild.

## Usage

1. **Clone the Repository:**

    ```bash
    git clone https://github.com/your-username/NuBuildDeploy.git
    ```

2. **Navigate to the Project Directory:**

    ```bash
    cd NuBuildDeploy
    ```

3. **Configure the Script:**

    Open `nuBuildDeploy.bat` and update the following variables:

    - `search`: Current version to search for.
    - `replace`: Version to replace the current version.
    - `project_base`: Your project's base name.
    - `nuget_key`: Your NuGet API key.

4. **Run the Script:**

    ```bash
    nuBuildDeploy.bat
    ```

    This automates version updates, builds, commits to Git, creates a NuGet package, and pushes it to the NuGet repository.

## Contributing

Contributions are welcome! Follow these steps:

1. **Fork the repository.**

2. **Create a Branch:**

    ```bash
    git checkout -b feature/new-feature
    ```

3. **Make Changes and Commit:**

    ```bash
    git commit -am 'Add new feature'
    ```

4. **Push Changes:**

    ```bash
    git push origin feature/new-feature
    ```

5. **Submit a Pull Request.**

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
