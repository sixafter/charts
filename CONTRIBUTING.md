
# Contributing

Thank you for your interest in contributing to this project. Your contributions help make this project better for everyone. This guide outlines the process for contributing to the project, including reporting issues, submitting pull requests, and adhering to the project's code of conduct.

## 📜 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How to Contribute](#how-to-contribute)
    - [Reporting Bugs](#reporting-bugs)
    - [Requesting Features](#requesting-features)
    - [Submitting Changes](#submitting-changes)
- [Coding Guidelines](#coding-guidelines)
    - [Style Guidelines](#style-guidelines)
- [Security Considerations](#-security-considerations)
- [Pull Request Process](#pull-request-process)
---

## 🛡️ Code of Conduct

This project adheres to the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to [osint@sixafter.com](mailto:osint@sixafter.com).

---

## Versioning

This software adheres to the [Semantic Versioning 2.0](https://semver.org/spec/v2.0.0.html) standard for version numbering as quoted here:

Given a version number MAJOR.MINOR.PATCH, increment the:

1. MAJOR version when you make incompatible API changes
2. MINOR version when you add functionality in a backward compatible manner
3. PATCH version when you make backward compatible bug fixes

Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.

---

## 🤝 How to Contribute

There are several ways you can contribute to this project, including reporting bugs, requesting features, and submitting changes.

### 🐛 Reporting Bugs

If you encounter a bug or unexpected behavior:

1. **Search Existing Issues**: Check if the issue has already been reported [here](https://github.com/sixafter/nanoid/issues).
2. **Open a New Issue**: If not, open a new issue describing the bug in detail.
    - **Provide a Clear Title**: Summarize the problem.
    - **Describe the Behavior**: Explain what you expected to happen versus what actually happened.
    - **Steps to Reproduce**: Include code snippets or commands that can help reproduce the issue.
    - **Environment Details**: Mention your Go version, operating system, and any other relevant information.

### 🌟 Requesting Features

To suggest new features or improvements:

1. **Search Existing Features**: Ensure your idea hasn't been discussed [here](https://github.com/sixafter/charts/issues?q=is%3Aissue+is%3Aopen+label%3Afeature).
2. **Open a New Feature Request**: Provide a detailed description of the feature.
    - **Describe the Feature**: Explain what the feature is and why it's needed.
    - **Use Cases**: Provide examples of how the feature would be used.
    - **Potential Implementation**: If possible, suggest how it could be implemented.

### ✨ Submitting Changes

Contributions in the form of bug fixes, improvements, or new features are welcome!

#### 1. Fork the Repository

Fork the repository to your GitHub account by clicking the **Fork** button at the top right of the repository page.

#### 2. Clone Your Fork

Clone the forked repository to your local machine:

```bash
git clone https://github.com/sixafter/charts.git
cd charts
```

#### 3. Create a New Branch

Create a new branch for your changes:

```bash
git checkout -b feature/your-feature-name
```

#### 4. Make Your Changes

#### 5. Run Tests and Linters

Ensure all tests pass and the code adheres to the style guidelines:

```bash
make lint
make test
```

#### 6. Commit Your Changes

Commit your changes with a clear and descriptive message:

```bash
git add .
git commit -m "Add descriptive commit message"
```

#### 7. Push to Your Fork

Push your changes to your forked repository:

```bash
git push origin feature/your-feature-name
```

#### 8. Open a Pull Request

Navigate to the original repository and click New Pull Request. Provide a clear description of your changes and link any related issues.

---

## 🎨 Coding Guidelines

Adhering to consistent coding standards ensures the codebase remains clean, readable, and maintainable.

### 🖋️ Style Guidelines

Adhering to consistent coding styles ensures the project remains readable and maintainable. Below are the style guidelines to follow when contributing:

1. **Code Formatting**:
   - Use proper indentation and spacing as per the language's standard practices.
   - Run the linter (e.g., `make lint`) to ensure your code adheres to the project's style rules.
   - For YAML files:
     - Use 2 spaces for indentation.
     - Avoid trailing whitespaces.
     - Use lowercase for keys unless otherwise required.
   - For Helm templates:
     - Wrap variables in double curly braces (`{{ }}`) and use `.Values` for accessing configuration values.

2. **Naming Conventions**:
   - Use descriptive, meaningful names for variables, functions, and files.
   - For Git branches:
     - Use a `type/description` format, such as `feature/add-issuer` or `defect/fix-linter-error`.
     - The only permissible types are:
        * `feature`: New functionality or enhancement that adds value to the system or addresses a specific user need.
        * `defect`: An issue or bug causing unintended behavior, preventing the system from meeting its requirements.
        * `debt`: Technical debt identifies suboptimal code that needs refactoring or improvement. This includes refacoring code that is difficult to maintain, lacks proper documentation, or is not scalable or upgrading dependencies.
        * `risk`: Technical risk associated with gaps in security, privacy or compliance. This includes vulnerabilities, misconfigurations, or other issues that could lead to a security incident.
        
   - For commits:
     - Use imperative tone, e.g., `Add feature X` or `Fix issue Y`.

3. **Comments**:
   - Provide clear and concise comments for non-obvious code.
   - For YAML and Helm templates, include comments to explain configuration values or template logic.

4. **Git Commit Messages**:
   - Start with a concise summary of the change (50 characters max).
   - Use the following format:
     ```
     <type>(<scope>): <summary>
     
     <optional long description>
     ```
   - Examples:
     - `defect(issuer): Correct private key reference logic`
     - `feature(chart): Add support for multiple DNS zones`

5. **File Organization**:
   - Group related resources and templates logically.
   - Avoid creating overly large files; split functionality into multiple files if necessary.

6. **Testing**:
   - Include unit tests for new functionality when applicable.
   - Validate Helm charts using `helm lint` and `helm template` to ensure correctness.

---

## 🔒 Security Considerations

Maintaining the security of the project is paramount. Follow these guidelines to ensure your contributions do not introduce vulnerabilities:

1. **Sensitive Data**:
   - Never include sensitive information (e.g., API keys, secrets, private keys) in the codebase.
   - Use Kubernetes Secrets or other secure mechanisms to store sensitive data.
   - Ensure that sensitive data in `values.yaml` is parameterized and documented with warnings.

2. **Dependency Management**:
   - Avoid introducing dependencies with known vulnerabilities.
   - Use tools like `trivy`, `snyk`, or `npm audit` to check for vulnerabilities in dependencies.

3. **Pull Request Reviews**:
   - Ensure all code changes are reviewed by maintainers or peers.
   - Address security-related comments promptly.

4. **Input Validation**:
   - Validate user inputs in templates and scripts to prevent injection vulnerabilities.
   - For Helm templates, use `quote` and `default` where applicable to avoid unintended behavior:
     ```yaml
     name: {{ .Values.name | quote }}
     ```

5. **Access Control**:
   - Avoid creating overly permissive RBAC roles in Kubernetes.
   - Follow the principle of least privilege for service accounts and roles.

6. **Testing for Security**:
   - Include tests that validate the secure handling of secrets and sensitive configurations.
   - Use tools like `kube-bench` or `kube-hunter` to ensure cluster-level security.

7. **Documentation**:
   - Clearly document any configurations or settings that may have security implications.
   - Warn users about potential risks (e.g., enabling self-signed certificates in production environments).

---

## 🚀 Pull Request Process

Follow these steps to create a successful pull request (PR):

1. Ensure Your Branch is Up-to-Date
   * Before opening a PR, make sure your branch is based on the latest main branch.
2. Create a Pull Request 
3. Address Feedback 
   * **Respond Promptly**: Engage with reviewers by responding to comments and making necessary changes. 
   * **Update Your PR**: Push additional commits to your branch to address feedback.
4. Merge the PR 
   * Once approved and all checks pass, your PR will be merged by a maintainer.

---

## 📝 Additional Resources

* [GitHub Flow](https://docs.github.com/en/get-started/using-github/github-flow) 
* [Contributor Covenant Code of Conduct](https://github.com/sixafter/nanoid/blob/main/CODE_OF_CONDUCT.md)

## 🙏 Thank You!

We appreciate your interest in contributing to this project! Your efforts help improve the project and support the community. If you have any questions or need assistance, feel free to reach out by opening an issue or contacting the maintainers.

Happy coding! 🎉
