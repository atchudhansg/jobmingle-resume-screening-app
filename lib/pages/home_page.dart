import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/components/login_or_register_page.dart';

// Define the global list to store applications
List<Application> applications = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthenticationWrapper(),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasData) {
          return RecruiterHomePage();
        } else {
          return LoginOrRegisterPage();
        }
      },
    );
  }
}

class RecruiterHomePage extends StatefulWidget {
  @override
  _RecruiterHomePageState createState() => _RecruiterHomePageState();
}

class _RecruiterHomePageState extends State<RecruiterHomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  int _selectedIndex = 0;
  List<String> jobTitles = [
    'Java Developer',
    'Testing',
    'DevOps Engineer',
    'Python Developer',
    'Web Designing',
    'HR',
    'Hadoop',
    'Blockchain',
    'ETL Developer',
    'Operations Manager',
    'Data Science',
    'Sales',
    'Mechanical Engineer',
    'Arts',
    'Database',
    'Electrical Engineering',
    'Health and fitness',
    'PMO',
    'Business Analyst',
    'DotNet Developer',
    'Automation Testing',
    'Network Security Engineer',
    'SAP Developer',
    'Civil Engineer',
    'Advocate',
  ];

  // Global list to store posted jobs
  List<JobPost> postedJobs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recruiter App'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
          if (_selectedIndex ==
              1) // Show dashboard button only on Job Offers page
            IconButton(
              icon: Icon(Icons.dashboard),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Dashboard(),
                  ),
                );
              },
            ),
        ],
      ),
      body: _selectedIndex == 0
          ? PostJobPage(jobTitles: jobTitles, onPostJob: _addPostedJob)
          : JobOffersPage(postedJobs: postedJobs, onApply: _applyForJob),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Post Job',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Job Offers',
          ),
        ],
      ),
    );
  }

  // Function to add a posted job to the global list
  void _addPostedJob(JobPost job) {
    setState(() {
      postedJobs.add(job);
    });
  }

  // Function to handle applying for a job
  void _applyForJob(BuildContext context, JobPost jobPost) async {
    TextEditingController resumeController = TextEditingController();
    TextEditingController nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Apply for ${jobPost.title}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: resumeController,
                maxLines: 4, // Increased the size
                decoration: InputDecoration(
                  hintText: 'Enter your resume',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _submitApplication(context, jobPost, nameController.text,
                      resumeController.text);
                },
                child: Text('Submit'),
              ),
            ],
          ),
        );
      },
    );
  }

  // Function to submit application
  Future<void> _submitApplication(
      BuildContext context, JobPost jobPost, String name, String resume) async {
    // Calculate similarity score
    double similarityScore = calculateSimilarity(jobPost.resume, resume);

    // Show match percentile
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Match Percentile'),
          content: Text(
              'Reference resume similarity: ${similarityScore.toStringAsFixed(2)}%'),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
                // Close the application submission dialog
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );

    // Do whatever you want with the similarity score
    // Add application to the list
    applications.add(Application(jobPost.title, name, resume, similarityScore));
  }
}

class PostJobPage extends StatefulWidget {
  final List<String> jobTitles;
  final Function(JobPost) onPostJob;

  PostJobPage({required this.jobTitles, required this.onPostJob});

  @override
  _PostJobPageState createState() => _PostJobPageState();
}

class _PostJobPageState extends State<PostJobPage> {
  String? _selectedJobTitle;
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _resumeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Set initial value to the first item in the jobTitles list
    _selectedJobTitle =
        widget.jobTitles.isNotEmpty ? widget.jobTitles[0] : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post a Job'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Job Title:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            DropdownButtonFormField(
              value: _selectedJobTitle,
              onChanged: (value) {
                setState(() {
                  _selectedJobTitle = value as String?;
                });
              },
              items: widget.jobTitles.map((title) {
                return DropdownMenuItem(
                  value: title,
                  child: Text(title),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            Text(
              'Job Description:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _descriptionController,
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Enter job description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Reference Resume:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _resumeController,
              maxLines: 4, // Increased the size
              decoration: InputDecoration(
                hintText: 'Enter reference resume',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Post the job by calling the callback function
                widget.onPostJob(JobPost(
                  title: _selectedJobTitle!,
                  description: _descriptionController.text,
                  resume: _resumeController.text,
                ));
              },
              child: Text('Post Job'),
            ),
          ],
        ),
      ),
    );
  }
}

class JobOffersPage extends StatelessWidget {
  final List<JobPost> postedJobs;
  final Function(BuildContext, JobPost) onApply;

  JobOffersPage({required this.postedJobs, required this.onApply});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: postedJobs.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: ListTile(
            title: Text(postedJobs[index].title),
            subtitle: Text(postedJobs[index].description),
            trailing: ElevatedButton(
              onPressed: () {
                _applyForJob(context, postedJobs[index]);
              },
              child: Text('Apply'),
            ),
          ),
        );
      },
    );
  }

  void _applyForJob(BuildContext context, JobPost jobPost) async {
    TextEditingController resumeController = TextEditingController();
    TextEditingController nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Apply for ${jobPost.title}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: resumeController,
                maxLines: 4, // Increased the size
                decoration: InputDecoration(
                  hintText: 'Enter your resume',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _submitApplication(context, jobPost, nameController.text,
                      resumeController.text);
                },
                child: Text('Submit'),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _submitApplication(
      BuildContext context, JobPost jobPost, String name, String resume) async {
    // Calculate similarity score
    double similarityScore = calculateSimilarity(jobPost.resume, resume);

    // Show match percentile
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Match Percentile'),
          content: Text(
              'Reference resume similarity: ${similarityScore.toStringAsFixed(2)}%'),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
                // Close the application submission dialog
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );

    // Do whatever you want with the similarity score
    // Add application to the list
    applications.add(Application(jobPost.title, name, resume, similarityScore));
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, List<Application>> jobApplications = {};

    // Segregate job postings with email id
    for (var application in applications) {
      if (!jobApplications.containsKey(application.jobTitle)) {
        jobApplications[application.jobTitle] = [];
      }
      jobApplications[application.jobTitle]!.add(application);
    }

    // Sort applications by similarity score
    jobApplications.forEach((key, value) {
      value.sort((a, b) => b.similarityScore.compareTo(a.similarityScore));
    });

    // Print top 10 applicants along with their name and similarity scores
    List<Widget> jobTiles = [];
    jobApplications.forEach((jobTitle, applications) {
      List<Widget> applicantTiles = [];
      for (int i = 0; i < applications.length && i < 10; i++) {
        applicantTiles.add(ListTile(
          title: Text('Applicant: ${applications[i].name}'),
          subtitle: Text(
              'Match Percentile: ${applications[i].similarityScore.toStringAsFixed(2)}%'),
        ));
      }
      jobTiles.add(Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Job Title: $jobTitle',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ...applicantTiles,
          ],
        ),
      ));
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Recruiter Dashboard'),
      ),
      body: ListView(
        children: jobTiles,
      ),
    );
  }
}

class JobPost {
  final String title;
  final String description;
  final String resume;

  JobPost({
    required this.title,
    required this.description,
    required this.resume,
  });
}

class Application {
  final String jobTitle;
  final String name;
  final String resume;
  final double similarityScore;

  Application(this.jobTitle, this.name, this.resume, this.similarityScore);
}

double calculateSimilarity(String jobDescription, String resume) {
  jobDescription = jobDescription.toLowerCase();
  resume = resume.toLowerCase();

  List<String> jobDescriptionWords = jobDescription.split(' ');
  List<String> resumeWords = resume.split(' ');

  int commonWords = 0;
  for (String word in jobDescriptionWords) {
    if (resumeWords.contains(word)) {
      commonWords++;
    }
  }

  double similarityScore = (commonWords / jobDescriptionWords.length) * 100;
  return similarityScore;
}
