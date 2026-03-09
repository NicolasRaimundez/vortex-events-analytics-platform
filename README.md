
![Data Model](images/vortex_data_model.png)


# 🌪️ Vortex Events: Automated Global Data Pipeline

**A 200,000+ Record Cloud Ingestion & Marketing Activation Ecosystem**

> **The Problem:** A global events brand was "spreadsheet-locked," manually processing 200k+ records across fragmented vendors, hitting Google Sheets cell limits, and risking PII data leaks.
> **The Solution:** I engineered a **Zero-Manual-Touch** Medallion Architecture in Google Cloud that automates everything from GMail ingestion to hyper-segmented marketing.

### 🖼️ Architecture & Strategy

* **Medallion Flow:** Bronze (Raw) $\rightarrow$ Silver (Cleaned) $\rightarrow$ Gold (Star Schema).
* **Privacy by Design:** I implemented a custom anonymization layer. To protect customer privacy, all PII (Emails/IDs) was hashed using $FARM\_FINGERPRINT$, ensuring the dataset is 100% GDPR/Data-Regulation compliant while remaining fully actionable for analytics.

---

### 🏗️ Technical Execution

#### **1. The Orchestrator (Apps Script & GMail)**

* **Automation:** A GMail listener triggers every Monday at 12:00 PM, extracting vendor CSVs (Ticketmaster, Eventbrite).
* **Impact:** Replaced 4+ hours of manual weekly entry with a native BigQuery load job.
* **Image to Show:** A snippet of your `gmail_ingestion.gs` code or a screenshot of the BigQuery "Job History" showing successful Monday loads.

#### **2. The Cloud Warehouse (SQL & BigQuery)**

* **Data Integrity:** Resolved critical DD/MM/YYYY date-parsing errors using `SAFE.PARSE_DATE`.
* **Star Schema:** Designed a 5-dimension Star Schema to optimize query performance for 200k+ rows.
* **Image to Show:** The **Vortex Events - Data Model (ERD)** or a screenshot of the **BigQuery Schema Tree** showing your `Dim` and `Fact` tables.

#### **3. The Insights (Looker Studio)**

* **KPIs:** Real-time tracking of global sales across Miami, Madrid, and Buenos Aires.
* **UX:** A high-performance Dark Mode dashboard with interactive heatmaps.
* **Image to Show:** The **Final Dark Mode Dashboard** screenshot.

---

### 📈 Business Impact & ROI

* **Scalability:** Successfully migrated from row-limited spreadsheets to a limitless Cloud Warehouse.
* **Marketing Precision:** Automated the sync to **Perfit**, enabling segmentation by `musical_genre`.
* **Engagement:** High-attendance genres like *Minimal* and *Techno* saw increased conversion through data-driven targeting.

---

### 🛠️ Technical Stack

* **Languages:** SQL (BigQuery/DML), JavaScript (Google Apps Script).
* **Platform:** Google Cloud (BigQuery, IAM, Cloud Scheduler).
* **Ecosystem:** GMail, Looker Studio, Perfit (CRM), Alchemer (Surveys).

---

### 💡 Key Learning: "Build for Scale"

The biggest challenge was moving from a "Flat File" mindset to a **Dimensional Modeling** mindset. By separating data into Dimensions (Who, Where) and Facts (Sales), I ensured the platform could grow from 200k to 2 million records without slowing down.

