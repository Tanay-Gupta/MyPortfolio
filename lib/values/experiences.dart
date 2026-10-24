part of values;

/// ─────────────────────────────────────────────────────────────────────────────
/// EXPERIENCE CONTENT FILE
/// ─────────────────────────────────────────────────────────────────────────────
/// To add a new role: copy one ExperienceData block, paste it at the TOP of
/// the list (most-recent first), fill in your details, and you're done.
/// No other file needs to change.
/// ─────────────────────────────────────────────────────────────────────────────

class AppExperiences {
  static final List<ExperienceData> all = [
    // ── Most recent first ──────────────────────────────────────────────────

    ExperienceData(
      company: 'IBM',
      position: 'AI Platform Engineer',
      companyUrl: 'https://www.ibm.com',
      location: 'Bengaluru, India · Hybrid',
      duration: 'Oct 2025 - Present',
      roles: [
        'Designing and deploying production AI systems and LLM-powered applications on cloud infrastructure.',
      ],
    ),

    ExperienceData(
      company: 'Accenture',
      position: 'Associate Software Engineer',
      companyUrl: 'https://www.accenture.com',
      location: 'Gurugram, India · On-site',
      duration: 'Sep 2024 - Oct 2025',
      roles: [
        'Designed and deployed a RAG-based chatbot on GKE using LangChain and LLMs, delivering company policies in a conversational format and reducing repetitive HR queries by 35%.',
        'Built the project\'s core data backbone, developing ETL pipelines in Python (Airflow, Dataflow) to ingest and structure unstructured data from Excels and legacy systems into BigQuery for semantic indexing.',
        'Developed and maintained containerized Flask APIs, serving indexed data at scale, handling 10K+ daily requests, and improving query performance across multiple internal systems.',
        'Optimized system performance by tuning BigQuery queries, batching embedding requests, and implementing GKE autoscaling, ensuring production SLAs while lowering cloud costs.',
        'Implemented a robust observability stack with GCP Logging, Monitoring, and Kafka, enabling real-time data quality monitoring and improving pipeline issue detection by 30%.',
      ],
    ),

    ExperienceData(
      company: 'MAQ Software',
      position: 'Associate Software Engineer',
      companyUrl: 'https://maqsoftware.com',
      location: 'Hyderabad, India · On-site',
      duration: 'Sep 2023 - Jul 2024',
      roles: [
        'Engineered large-scale, automated data pipelines (Python, SQL) to process terabytes of financial data for Microsoft, increasing reporting accuracy by 99% and enabling near real-time analytics.',
        'Developed and operated RESTful microservices with Python, serving 10K+ daily requests and acting as a centralized data backbone for Microsoft\'s MSXi web portal and Azure-powered Power BI dashboards.',
        'Built automation workflows for data integration and reporting, reducing manual intervention and improving system reliability across hybrid cloud environments.',
        'Delivered a suite of automated Power BI dashboards for executive leadership, visualizing critical KPIs that cut the time for monthly financial reviews by over 40% and contributed to a 5% improvement in sales forecast accuracy.',
      ],
    ),

    ExperienceData(
      company: 'The Internet Folks',
      position: 'Software Engineer Intern',
      companyUrl: StringConst.SITE_URL,
      location: 'Remote',
      duration: 'Jul 2023 - Sep 2023',
      roles: [
        'Developed a cross-platform ride tracking app using Flutter, achieving 10K+ installs and strong user engagement.',
        'Built a React.js admin dashboard to automate reward distribution and user management, cutting manual overhead by 60%.',
        'Improved user retention by 22% through in-app rewards and Firebase push notifications.',
        'Collaborated with designers and backend teams to deliver a mobile-first UI with real-time updates and WCAG compliance.',
      ],
    ),

    ExperienceData(
      company: 'Persistent Systems',
      position: 'Martian Summer Intern',
      companyUrl: StringConst.SITE_URL,
      location: 'Remote',
      duration: 'Jun 2023 - Aug 2023',
      roles: [
        'Gained expertise in Linux, Data Structures, Java, and Database Management System (DBMS) during apprenticeship, forming a solid skill set for software development.',
      ],
    ),

    ExperienceData(
      company: 'Rotaract Club of GL Bajaj',
      position: 'Community Service Director',
      companyUrl: StringConst.SITE_URL,
      location: 'Greater Noida',
      duration: 'July 2023 - January 2024',
      roles: [
        'Led Rotaract members in coordinating community service initiatives, fostering impactful collaborations with multiple NGOs. Organized 30+ donation drives to uplift and support underprivileged communities.',
        'Championed the promotion of social awareness and advocated for positive change, leveraging Rotaract\'s initiatives to make a lasting impact within the community.',
      ],
    ),

    ExperienceData(
      company: 'Google Developer Students Club',
      position: 'Application Development Core Member',
      companyUrl: StringConst.SITE_URL,
      location: 'GL Bajaj Institute of Technology and Management',
      duration: 'Aug 2021 - Sept 2022',
      roles: [
        '𝗠𝗲𝗻𝘁𝗼𝗿𝗲𝗱 students in Flutter application development, helping them to develop skills and confidence in the technology.',
        'Participated in the planning and execution of club events and workshops, including organizing talks on new technologies and best practices in software development.',
        'Learned new skills and technologies through the club\'s resources and connections.',
      ],
    ),
  ];
}
