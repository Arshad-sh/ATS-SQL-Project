# Applicant Tracking System Database Design

## Tables

1. Companies
2. Recruiters
3. Candidates
4. Jobs
5. Skills
6. CandidateSkills
7. Applications
8. Interviews
9. InterviewFeedback
10. Offers
11. Resumes
12. StatusHistory

## Relationships

- One Company → Many Recruiters
- One Company → Many Jobs
- One Candidate → One Resume
- One Candidate → Many Applications
- One Job → Many Applications
- Many Candidates ↔ Many Skills
- One Application → One Interview
- One Interview → One Feedback
- One Feedback → One Offer

Final Relationship Diagram:

Companies
    │
    ├──────────────┐
    ▼              ▼
Recruiters       Jobs
                    │
                    ▼
             Applications
             ▲          ▲
             │          │
      Candidates        │
             │          │
             ▼          │
         Resumes        │
             │          │
             ▼          ▼
      CandidateSkills Interviews
             ▲          │
             │          ▼
           Skills  InterviewFeedback
                         │
                         ▼
                      Offers

Applications
      │
      ▼
StatusHistory