# ora-projs  
Oracle automation and data solutions by **am‑torr (A. Torralba)** — PL/SQL Developer & Automation Engineer specializing in database scripting, CI/CD, and data pipeline design.  
📍 Focus: PL/SQL | Python | CI/CD Workflow | ETL Planning | Data Automation  
[▶ Go to MAIN branch (click here)](https://github.com/am-torr/ora-projs/tree/main)  

---

> [!NOTE]  
> **Project:** GitHub Actions Deployment (CI/CD Workflow) <br/>  
> **Description:** Implements a CI/CD pipeline for automated build and deployment to AWS. Upon merge, it creates a build ticket, pushes Docker images to ECR, and sends Slack notifications. <br/>  
> **Benefits:** <br/>  
> &emsp; - Speeds up deployment cycle by eliminating manual build steps <br/>  
> &emsp; - Improves code quality and maintainability through repeatable pipelines <br/>  
> &emsp; - Enhances traceability with Slack alerts and tagged build versions <br/>  
> **Status:** In Progress <br/>  

**General Checklist** </br>
- [x] Define GitHub Actions trigger and workflow file </br>
- [ ] Automate ticket creation for pull requests </br>
- [ ] Integrate Slack build notification API </br>
- [ ] Connect AWS deployment via CloudShell and ECR </br>

**Tools / Tech Used**  
PowerShell | GitHub Actions | AWS (ECR, IAM, CloudShell) | AWS CLI | Docker | VS Code  

**Challenges Encountered:** </br>
- [x] Resolved image push failure in CloudShell via CLI installation </br>
- [x] Addressed Docker path conflict by updating PowerShell environment </br>
- [x] Updated IAM roles to allow ECR access </br>
- [x] Fixed secrets bug in GitHub Actions token authentication </br>

**Current Progress:** CI/CD pipeline successfully builds and deploys Docker image to AWS ECR.  
<img width="929" height="246" alt="image" src="https://github.com/user-attachments/assets/6c19d38c-1789-4e9e-b8c0-62ef7333a2a8" />  

---

> [!NOTE]  
> **Project:** Mortgage Generator (PL/SQL Computation) <br/>  
> **Branch:** [MORTGAGE‑INIT (click here)](https://github.com/am-torr/ora-projs/tree/mortgage-init) <br/>  
> **Description:** PL/SQL mortgage calculator that generates monthly amortizations based on rate and period parameters. Prototype for integration into financial reporting UIs. <br/>  
> **Benefits:** <br/>  
> &emsp; - Automates interest and principal computation for loan schedules <br/>  
> &emsp; - Eliminates manual spreadsheet formulas <br/>  
> &emsp; - Prepares data for future Oracle APEX report generation <br/>  
> **Status:** In Progress <br/>  

**General Checklist** </br>
- [x] Collect reference bank rate data </br>
- [x] Translate mortgage formulas into PL/SQL logic </br>
- [ ] Store computed outputs into tables </br>
- [ ] Generate amortization report using Oracle APEX </br>

**Tools / Tech Used**  
Oracle Data Modeler | Oracle SQL Developer | GitHub  

**Challenges Encountered:** </br>
- [x] Formula accuracy validation against bank calculations </br>
- [x] Transformation of compound interest logic into dynamic SQL procedures </br>

**Next Step:** Create UI layer on APEX for analytical report preview.  

-------------------------------------------------------------------------------------------------------------------------------------------

> [!NOTE]  
> **Project:** ETL Pipeline (Planning Stage) <br/>  
> <img width="4200" height="982" alt="etl_architecture_a_torralba" src="https://github.com/user-attachments/assets/fa5ace48-a97b-4cc2-ae5d-374f1cf7fe2c" />
**Description:** Concept design for a daily ETL pipeline that extracts and validates data from multiple sources using PL/SQL and Python with OpenSearch visualization. <br/>  
> **Benefits:** <br/>  
> &emsp; - Centralizes data processing logic for future automation <br/>  
> &emsp; - Improves visibility of data integrity via log validation dashboards <br/>  
> &emsp; - Supports incremental batch automation architecture <br/>  
> **Status:** Open <br/>  

**General Checklist** </br>
- [ ] Define ETL flow stages and data mappings </br>
- [ ] Implement basic Python validation modules </br>
- [ ] Create OpenSearch dashboard for log summaries </br>

**Tools / Tech Used**  
Python | AWS Glue | OpenSearch | Kibana | Oracle PL/SQL  

**Challenges Encountered:** </br>
- [ ] Validating large PL/SQL extracts with Python automation </br>
- [ ] Defining schema compatibility for multi‑source input data </br>

**Next Step:** Automate error reporting and integrate Kibana dashboard visuals.  

---

## 📊 Highlights  
Achieved key milestones across CI/CD automation and PL/SQL workflow projects:  
- Automated code deployment reducing release cycle time by half.  
- Improved financial data computations accuracy through formula validation.  
- Established reusable PL/SQL structure for data automation and report generation.  

---

## 🧑‍💻 About  
Results‑oriented **Oracle Data and Automation Engineer (DevOps‑oriented)** with 10 years of experience in PL/SQL development, Python automation, and database workflow optimization. Experienced across legacy and modern Oracle environments, including Oracle E‑Business Suite (EBS), APEX, and stand‑alone PL/SQL applications.  

Proficient in implementing **CI/CD and DevOps practices** using GitHub Actions, Docker, and AWS (ECR, IAM, CloudShell). Skilled in transforming manual deployment processes into automated, repeatable pipelines while enhancing data accuracy and system efficiency.  

Combines enterprise‑level discipline with freelance adaptability to deliver high‑quality data solutions for financial and workflow‑driven applications. Currently open to **full‑time roles in Database Engineering, Automation, or DevOps**, leveraging Oracle and Python for hybrid system modernization projects.  
 
🔗 [Repository Main Page](https://github.com/am-torr/ora-projs)
