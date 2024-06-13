# JobMingle: Revolutionizing Recruitment Management

JobMingle is a web-based recruitment management platform designed to streamline the hiring process for both recruiters and applicants. Built with Flutter for the frontend and Firebase for the backend, JobMingle offers a scalable, secure, and efficient solution for modern recruitment needs.

## Table of Contents
- [Key Features](#key-features)
- [How It Works](#how-it-works)
- [Installation](#installation)
- [Future Work](#future-work)
- [License](#license)

## Key Features

- **Intuitive Interface:** User-friendly interface for recruiters to post job openings, manage applications, and track candidate progress, while applicants can search and apply for jobs effortlessly.
- **Advanced Candidate Management:** Robust tools for recruiters to efficiently review, screen, and track candidate progress throughout the hiring pipeline.
- **Seamless Communication:** Built-in messaging features facilitate transparent and collaborative communication between recruiters and applicants.
- **Powerful Search and Filtering:** Advanced search and filtering options enable applicants to refine their job search based on location, industry, and job type.
- **Scalable Infrastructure:** Leveraging Firebase backend ensures scalability, security, and real-time data synchronization.
- **Mobile Accessibility:** Future plans include developing a mobile app for on-the-go access, enhancing flexibility and convenience for users.
- **Google Authentication:** Supports Google authentication using Firebase for secure and convenient user login.

## How It Works

1. **Reference Resume Upload:** For every job opening, recruiters upload a reference resume in text format containing all the important points required for the position.
2. **Applicant Resume Submission:** Applicants apply for jobs by uploading their resumes in text format in the textbox provided for each job opening.
3. **Cosine Similarity Calculation:** The backend employs a machine learning model to calculate the cosine similarity score between the reference resume and the applicant's resume, producing a match percentile.
4. **Top Candidates Dashboard:** Recruiters can view the top 10 applicants based on match percentile in the employer dashboard.
5. **Google Authentication:** Users can log in directly using their Google account or by entering their email and password.

## Installation

To install JobMingle, follow these steps:

1. Clone the repository:
    ```sh
    git clone https://github.com/your-username/jobmingle.git
    ```
2. Install dependencies:
    ```sh
    flutter pub get
    ```
3. Run the application:
    ```sh
    flutter run
    ```

## Usage

- **Recruiters:** Post job openings, manage applications, and track candidate progress using the intuitive dashboard.
- **Applicants:** Search for jobs, view job details, and apply seamlessly with advanced search and filtering options. Upload resumes in text format to receive a match percentile score based on similarity to the reference resume.

## Future Work

- Integration of artificial intelligence and machine learning algorithms for enhanced candidate matching.
- Development of a dedicated mobile application to provide users with on-the-go access.
- Expansion to cater to a wider range of industries and job types.
- Enhanced analytics and reporting capabilities for recruiters.
- Integration with learning and development platforms to offer additional value to users.
- Transition from local storage to using Hive for better scalability as the number of users increases.
- Development of a separate server, such as Flask, to handle the machine learning tasks currently inbuilt within the app.


## License

This project is licensed under the [MIT License](LICENSE).

Join JobMingle today and experience the future of recruitment management.
