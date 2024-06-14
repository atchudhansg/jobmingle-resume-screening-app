# JobMingle: A Simple HR Solution

JobMingle is a app-based recruitment management platform designed to streamline the hiring process for both recruiters and applicants. Built with Flutter for the frontend and Firebase for the backend, JobMingle offers a scalable, secure, and efficient solution for modern recruitment needs.

## Table of Contents
- [Key Features](#key-features)
- [How It Works](#how-it-works)
- [Installation](#installation)
- [Future Work](#future-work)
- [License](#license)

## Key Features

- **Intuitive Interface:** User-friendly interface for recruiters to post job openings, manage applications, and track candidate progress, while applicants can search and apply for jobs effortlessly.
- **Advanced Candidate Management:** Robust tools for recruiters to efficiently review, screen, and track candidate progress throughout the hiring pipeline.
- **Powerful Search and Filtering:** Advanced search and filtering options enable applicants to refine their job search based on location, industry, and job type.
- **Scalable Infrastructure:** Utilizing Firebase backend ensures scalability, security, and real-time data synchronization.
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
    https://github.com/atchudhansg/jobmingle-resume-screening-app.git
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

## Screenshots

<p align="center">
  <img src="https://github.com/atchudhansg/jobmingle-resume-screening-app/assets/116624804/51fd6370-8c88-40a5-8561-d495c91e915f" alt="Screenshot 1" width="200"/>
  <img src="https://github.com/atchudhansg/jobmingle-resume-screening-app/assets/116624804/bd95b1a6-bba5-441f-a57f-3534a389df43" alt="Screenshot 2" width="200"/>
  <img src="https://github.com/atchudhansg/jobmingle-resume-screening-app/assets/116624804/84fd8dca-30e0-42b5-8231-8b3ca4e93596" alt="Screenshot 3" width="200"/>
</p>
<p align="center">
  <img src="https://github.com/atchudhansg/jobmingle-resume-screening-app/assets/116624804/4d1ba3d2-8459-4a93-a0d8-f4cb7f1bf301" alt="Screenshot 4" width="200"/>
  <img src="https://github.com/atchudhansg/jobmingle-resume-screening-app/assets/116624804/d81a2e69-4864-4144-8150-bdb2b449e124" alt="Screenshot 5" width="200"/>
  <img src="https://github.com/atchudhansg/jobmingle-resume-screening-app/assets/116624804/baef355f-0605-49ee-9238-329b95ff2de0" alt="Screenshot 6" width="200"/>
</p>
<p align="center">
  <img src="https://github.com/atchudhansg/jobmingle-resume-screening-app/assets/116624804/fce1cd5d-308d-4593-a160-af74a0a9f750" alt="Screenshot 7" width="200"/>
  <img src="https://github.com/atchudhansg/jobmingle-resume-screening-app/assets/116624804/b89c6700-97a8-4d9d-87d3-6c8b04576a74" alt="Screenshot 8" width="200"/>
  <img src="https://github.com/atchudhansg/jobmingle-resume-screening-app/assets/116624804/d9693725-bee5-4db7-b06b-ff59b6f11148" alt="Screenshot 9" width="200"/>
</p>


