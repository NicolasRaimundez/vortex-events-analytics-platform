# 📨💃🕺 Dance Event Inbound
# Scalable Email Automation for 200k+ Dance Fans

**Scale: 200,000+ Unique Records | Architecture: Medallion (Bronze to Gold) | Trigger: Monday 12:00 PM**

> **The Problem:** A global events brand was "spreadsheet-locked," manually processing 200k+ records across fragmented vendors, hitting Google Sheets cell limits, and risking PII data leaks.
> **The Solution:** I engineered a **Zero-Manual-Touch** Medallion Architecture in Google Cloud that automates everything from Gmail ingestion to hyper-segmented marketing activation.

## 🏗️ Architecture & Strategy

<p align="center">
<img src="images/Project_Architecture.png" width="800" alt="Project Architecture">
</p>

* **Medallion Flow:** Bronze (Raw) $\rightarrow$ Silver (Standardized) $\rightarrow$ Gold (Dimensional Star Schema).
* **Privacy by Design:** All project data was fully **anonymized** to maintain data regulation compliance, PII (Emails/IDs), ensuring the dataset remains 100% usable for analytics while protecting individual privacy.

---

## 🏗️ Technical Execution

### 1. The Orchestrator (Google Apps Script)

* **Automation:** A Gmail listener triggers every Monday at 12:00 PM, extracting vendor CSVs (Ticketmaster, Eventbrite, Passline).
* **Impact:** Replaced ~4 hours of manual weekly entry with a native BigQuery load job, bypassing the 10-million-cell limit of legacy spreadsheets.

### 2. The Cloud Warehouse (SQL & BigQuery)

<p align="center">
<img src="images/vortex_data_model.png" width="800" alt="Vortex Events Star Schema">
</p>

* **Data Integrity:** Resolved critical DD/MM/YYYY date-parsing errors found in the 200k+ records using `SAFE.PARSE_DATE`.
* **Star Schema:** Designed a high-performance Dimensional Model with optimized fact and dimension tables (Client, Event, Artist, Location, Vendor) to minimize query costs and maximize dashboard speed.

### 3. Business Intelligence (Looker Studio)

<p align="center">
<img src="images/vortex_dashboard_1.png" width="400" alt="Vortex Dashboard 1">
<img src="images/vortex_dashboard_2.png" width="400" alt="Vortex Dashboard 2">
</p>

* **KPIs:** Real-time tracking of global sales across Miami, Madrid, and Buenos Aires.
* **UX:** Interactive Dark Mode dashboards with heatmaps to identify top-performing international markets and musical genres.

---

## 📈 Business Impact & ROI

* **Scalability:** Successfully migrated the ecosystem from row-limited Google Sheets to a limitless Cloud Warehouse.
* **Marketing Precision:** Refined customer segments are synced with **Perfit** (Marketing Automation), enabling hyper-segmented email campaigns based on "Favorite Musical Genre."
* **Post-Event Loop:** Integrated **Alchemer** surveys back into BigQuery to enrich customer profiles for the next event cycle.

## 🛠️ Technical Stack

* **Languages:** SQL (BigQuery/DML), JavaScript (Google Apps Script).
* **Cloud:** Google Cloud Platform (BigQuery, IAM).
* **Ecosystem:** GMail, Looker Studio, Perfit, Alchemer.

## 💡 Key Learning: "Build for Scale"

The biggest challenge was moving from a "Flat File" mindset to a **Dimensional Modeling** mindset. By separating data into Dimensions (Who, Where) and Facts (Sales), I ensured the platform could grow from 200k to 2 million records without a decrease in analytical performance.
