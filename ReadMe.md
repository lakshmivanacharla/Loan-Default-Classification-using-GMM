# Loan Default Classification using Gaussian Mixture Models (GMM)

## Description
This project classifies customers as good or bad based on their probability of loan default using Gaussian Mixture Models (GMM). It also calculates expected loss (EL) and expected gain (EP) based on these probabilities.

## Table of Contents
- [Objective](#objective)
- [Methodology](#methodology)
- [Installation](#installation)
- [Usage](#usage)
- [Results](#results)
- [Contributing](#contributing)
- [License](#license)

## Objective
The objective of this project is to classify customers based on their likelihood of defaulting on loans and to calculate expected loss and gain.

## Methodology
The following steps were taken during the analysis:
1. **Data Cleaning**:
   - Identified and imputed missing values using the mean.
   - Scaled features (loan amount and income) using Min-Max scaling.
   - Handled anomalies (e.g., ages exceeding 100) by replacing them with common age values.
   
2. **Data Splitting**:
   - Split the dataset into training and testing sets.
   - Checked for class imbalance and handled it using SMOTE (Synthetic Minority Oversampling Technique).

3. **Clustering**:
   - Determined the optimal number of clusters using AIC and BIC, identifying 2 clusters.
   - Applied GMM on the training data, resulting in probabilities for each point.

4. **Expected Loss and Gain Calculation**:
   - Calculated expected loss (EL) and expected gain (EP) based on the probabilities of default.

5. **Model Evaluation**:
   - Evaluated the model using accuracy; the final model achieved an accuracy of 73%.

## Installation
To set up this project, you will need the following packages:
```bash
pip install numpy pandas scikit-learn imbalanced-learn
