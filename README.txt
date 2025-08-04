# scRNA-seq Analysis of Cardiac Organoids

This project involves the analysis of single-cell RNA-seq data from **cardiac organoids** composed of 15% endocardial cells and 85% cardiomyocytes. The goal is to understand the transcriptional differences between **control and cardiomyopathy-derived organoids**, and within cardiomyopathy samples, to identify specific drivers of **LVNC (Left Ventricular Non-Compaction)** compared to **DCM (Dilated Cardiomyopathy)** and **HCM (Hypertrophic Cardiomyopathy)**.

---

## 🧪 Experimental Design

- **Organoid Composition**: 15% endocardial + 85% cardiomyocytes  
- **Treatment**: Induction of trabeculation
- **Goal**: Study transcriptional response to trabeculation across different sample groups

### Sample Grouping

| Group          | Samples                      |
|----------------|------------------------------|
| Control        | S19-3, S25-3, S26-3          |
| Cardiomyopathy (DCM) | GW10, GW53, GW168         |
| Cardiomyopathy (HCM) | GW129, GW167, GW169        |
| Cardiomyopathy (LVNC) | GW30, GW64, GW159         |

---

## 🔍 Key Questions

1. **Control vs. Cardiomyopathy**: What are the key transcriptomic differences?
2. **LVNC-specific Features**: What distinguishes LVNC from DCM and HCM, particularly regarding trabeculation and myocardial compaction?

---

## 🧬 Data Processing

- Raw reads were processed using [Parse Biosciences split-pipe v1.0.6p](https://www.parsebiosciences.com/) with default parameters.
- Reference genome: GRCh38

---

## 📂 Repository Structure

| File | Description |
|------|-------------|
| `01. Pipeline Setup and Use.pdf` | Step-by-step guide to setting up and using the Parse pipeline |
| `ParseBiosciences-Pipeline.1.0.6p.zip` | Parse split-pipe v1.0.6p pipeline (archived) |
| `scRNA_seq_workflow.sh` | Shell script for running the analysis pipeline |
| `scRNA-seq-analysis-of-Cardiac-Organoid.rmd` | R Markdown file with detailed analysis code |
| `scRNA-seq-analysis-of-Cardiac-Organoid.pdf` | Full project summary with background, figures, and results |
| `README.txt` | Legacy project description (see this `README.md` instead) |
| `.gitignore` | Git ignore rules |
| `scRNA-seq-analysis-of-Cardiac-Organoid.Rproj` | RStudio project file |

---

## 📘 Documentation

For a full project description with embedded figures and results:

📄 [`scRNA-seq-analysis-of-Cardiac-Organoid.pdf`](scRNA-seq-analysis-of-Cardiac-Organoid.pdf)

For reproducible code and figures:

📊 [`scRNA-seq-analysis-of-Cardiac-Organoid.rmd`](scRNA-seq-analysis-of-Cardiac-Organoid.rmd)

---

## 🛠️ Requirements

- R (≥ 4.0)
- RStudio (recommended)
- Shell environment (Linux/MacOS or WSL on Windows)
- Dependencies: See `.Rmd` file for required R packages

---

## 🧑‍💻 Author

**Achal Neupane**  
Senior Bioinformatics Research Scientist  
St. Jude Children’s Research Hospital  

---

## 📝 License

This repository is intended for research use only.

