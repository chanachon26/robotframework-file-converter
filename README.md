# Robot Framework - File Converter Automation

## Overview
This project is an automation framework built with **Robot Framework + Python** to handle complex file transformation pipelines used in financial data processing.

It supports converting and validating multiple file formats such as:
- Fixed-length text files (.txt)
- Pipe-delimited files
- Excel (.xlsx)
- CSV
- Structured financial data feeds

The system is designed for **end-to-end data conversion validation**, including backend integration with DB and SFTP.

---

## Key Features

### File Processing Engine
- Convert `.txt` (fixed-width / delimited) → `.xlsx`
- Maintain mapping rules via YAML configuration
- Support multi-format input pipelines

### Data Integration
- Database validation (MariaDB / SQL queries)
- SFTP file transfer automation
- Downstream file validation

### Automation Utilities
- Dynamic file renaming by date
- Config-driven execution (YAML-based)
- Reusable keyword libraries (Robot Framework)
