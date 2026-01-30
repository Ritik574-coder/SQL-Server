# Mathematics for Data Analysis: A Practical Guide

## Table of Contents
1. [Descriptive Statistics](#descriptive-statistics)
2. [Probability](#probability)
3. [Distributions](#distributions)
4. [Statistical Inference](#statistical-inference)
5. [Correlation and Regression](#correlation-and-regression)
6. [Linear Algebra Basics](#linear-algebra-basics)
7. [Calculus Basics](#calculus-basics)

---

## 1. Descriptive Statistics

### Mean (Average)
**Formula:**
```
Mean = (x₁ + x₂ + x₃ + ... + xₙ) / n
or
Mean = Σx / n
```

**Real-World Example:**
You're analyzing website traffic. Daily visitors for a week: 120, 145, 130, 200, 175, 190, 165

```
Mean = (120 + 145 + 130 + 200 + 175 + 190 + 165) / 7
Mean = 1,125 / 7 = 160.7 visitors/day
```

### Median (Middle Value)
**Formula:**
- Sort data from smallest to largest
- If n is odd: Median = middle value
- If n is even: Median = average of two middle values

**Real-World Example:**
Employee salaries: $35K, $38K, $42K, $45K, $120K

```
Median = $42K (the middle value)
Mean = $56K (skewed by the $120K outlier)
```
*The median better represents typical salary here!*

### Mode (Most Frequent Value)
**Formula:** The value that appears most often

**Real-World Example:**
Product ratings: 5, 4, 5, 3, 5, 4, 5, 2, 5

```
Mode = 5 (appears 5 times)
```

### Variance
**Formula:**
```
Population Variance (σ²) = Σ(xᵢ - μ)² / N

Sample Variance (s²) = Σ(xᵢ - x̄)² / (n - 1)
```

**Real-World Example:**
Daily sales: $1000, $1200, $1100, $1300, $900

```
Mean = $1,100
Variance = [(1000-1100)² + (1200-1100)² + (1100-1100)² + (1300-1100)² + (900-1100)²] / 4
Variance = [10,000 + 10,000 + 0 + 40,000 + 40,000] / 4 = 25,000
```

### Standard Deviation
**Formula:**
```
Standard Deviation (σ or s) = √Variance
```

**Real-World Example:**
From above: `σ = √25,000 = $158.11`

This means sales typically vary by about $158 from the average.

### Percentiles and Quartiles
**Formulas:**
```
Percentile Position = (P/100) × (n + 1)

Q1 (25th percentile) = First Quartile
Q2 (50th percentile) = Median
Q3 (75th percentile) = Third Quartile

IQR (Interquartile Range) = Q3 - Q1
```

**Real-World Example:**
Customer wait times (sorted): 2, 3, 5, 7, 8, 10, 12, 15, 18, 20 minutes

```
Q1 position = 0.25 × 11 = 2.75 → Q1 ≈ 4 minutes
Q2 (Median) = (8 + 10) / 2 = 9 minutes
Q3 position = 0.75 × 11 = 8.25 → Q3 ≈ 15.75 minutes
IQR = 15.75 - 4 = 11.75 minutes
```

---

## 2. Probability

### Basic Probability
**Formula:**
```
P(Event) = Number of favorable outcomes / Total number of possible outcomes
```

**Real-World Example:**
What's the probability a customer buys after visiting your website?
- Visitors: 1,000
- Purchases: 50

```
P(Purchase) = 50/1,000 = 0.05 or 5%
```

### Conditional Probability
**Formula:**
```
P(A|B) = P(A and B) / P(B)
```
Read as: "Probability of A given B has occurred"

**Real-World Example:**
Email campaign analysis:
- 10,000 emails sent
- 2,000 opened (20%)
- 200 clicked a link (2% of total)

```
P(Click|Opened) = P(Click and Opened) / P(Opened)
P(Click|Opened) = 0.02 / 0.20 = 0.10 or 10%
```
10% of people who open the email click the link.

### Bayes' Theorem
**Formula:**
```
P(A|B) = [P(B|A) × P(A)] / P(B)
```

**Real-World Example:**
Fraud detection:
- 1% of transactions are fraudulent: P(Fraud) = 0.01
- Fraud detection flags 90% of fraud: P(Flag|Fraud) = 0.90
- Detection flags 5% of legitimate transactions: P(Flag|Legit) = 0.05

What's the probability a flagged transaction is actually fraud?

```
P(Fraud|Flag) = [P(Flag|Fraud) × P(Fraud)] / P(Flag)

P(Flag) = P(Flag|Fraud) × P(Fraud) + P(Flag|Legit) × P(Legit)
P(Flag) = (0.90 × 0.01) + (0.05 × 0.99) = 0.009 + 0.0495 = 0.0585

P(Fraud|Flag) = (0.90 × 0.01) / 0.0585 = 0.154 or 15.4%
```

Only 15.4% of flagged transactions are actually fraud!

---

## 3. Distributions

### Normal Distribution (Bell Curve)
**Formula:**
```
f(x) = (1 / (σ√(2π))) × e^(-((x-μ)²)/(2σ²))
```

**Key Properties:**
- 68% of data within 1 standard deviation (μ ± σ)
- 95% within 2 standard deviations (μ ± 2σ)
- 99.7% within 3 standard deviations (μ ± 3σ)

**Real-World Example:**
Heights of adult males: Mean = 70 inches, SD = 3 inches

```
68% of men are between 67-73 inches
95% are between 64-76 inches
99.7% are between 61-79 inches
```

### Z-Score (Standardization)
**Formula:**
```
Z = (x - μ) / σ
```

**Real-World Example:**
Test scores: Mean = 75, SD = 10. Your score: 85

```
Z = (85 - 75) / 10 = 1.0
```
You scored 1 standard deviation above average (better than ~84% of people).

### Binomial Distribution
**Formula:**
```
P(X = k) = C(n,k) × p^k × (1-p)^(n-k)

where C(n,k) = n! / (k! × (n-k)!)
```

**Real-World Example:**
Email conversion rate is 5%. If you send to 10 people, what's the probability exactly 2 will convert?

```
P(X = 2) = C(10,2) × 0.05² × 0.95⁸
C(10,2) = 10!/(2!×8!) = 45
P(X = 2) = 45 × 0.0025 × 0.6634 = 0.0746 or 7.46%
```

### Poisson Distribution
**Formula:**
```
P(X = k) = (λ^k × e^(-λ)) / k!
```
where λ = average rate

**Real-World Example:**
Average 3 customer support tickets per hour. Probability of exactly 5 in the next hour?

```
P(X = 5) = (3⁵ × e^(-3)) / 5!
P(X = 5) = (243 × 0.0498) / 120 = 0.1008 or 10.08%
```

---

## 4. Statistical Inference

### Confidence Interval
**Formula:**
```
CI = x̄ ± (Z × σ/√n)

For 95% confidence: Z = 1.96
For 99% confidence: Z = 2.58
```

**Real-World Example:**
You survey 100 customers. Average satisfaction: 7.5/10, SD = 1.5

```
95% CI = 7.5 ± (1.96 × 1.5/√100)
95% CI = 7.5 ± (1.96 × 0.15)
95% CI = 7.5 ± 0.294
95% CI = [7.21, 7.79]
```
We're 95% confident the true average is between 7.21 and 7.79.

### T-Test (Compare Two Groups)
**Formula:**
```
t = (x̄₁ - x̄₂) / √(s₁²/n₁ + s₂²/n₂)
```

**Real-World Example:**
Testing two website designs:
- Design A: Mean conversion = 5.2%, SD = 1.1%, n = 100
- Design B: Mean conversion = 6.1%, SD = 1.3%, n = 100

```
t = (6.1 - 5.2) / √(1.3²/100 + 1.1²/100)
t = 0.9 / √(0.0169 + 0.0121)
t = 0.9 / 0.170 = 5.29
```
With t = 5.29 and df = 198, this is statistically significant (p < 0.001).
Design B is genuinely better!

### Chi-Square Test
**Formula:**
```
χ² = Σ[(Observed - Expected)² / Expected]
```

**Real-World Example:**
Testing if color preference depends on gender:

|        | Red | Blue | Green | Total |
|--------|-----|------|-------|-------|
| Male   | 20  | 30   | 10    | 60    |
| Female | 30  | 20   | 10    | 60    |
| Total  | 50  | 50   | 20    | 120   |

Expected for Male-Red = (60 × 50) / 120 = 25

```
χ² = (20-25)²/25 + (30-25)²/25 + (10-10)²/10 + (30-25)²/25 + (20-25)²/25 + (10-10)²/10
χ² = 1 + 1 + 0 + 1 + 1 + 0 = 4.0
```

### P-Value Interpretation
- p < 0.01: Very strong evidence against null hypothesis
- p < 0.05: Strong evidence (standard threshold)
- p < 0.10: Weak evidence
- p ≥ 0.10: Insufficient evidence

---

## 5. Correlation and Regression

### Pearson Correlation Coefficient
**Formula:**
```
r = Σ[(xᵢ - x̄)(yᵢ - ȳ)] / √[Σ(xᵢ - x̄)² × Σ(yᵢ - ȳ)²]
```

Range: -1 to +1
- +1 = perfect positive correlation
- 0 = no correlation
- -1 = perfect negative correlation

**Real-World Example:**
Advertising spend vs. sales:

| Ad Spend ($1000) | Sales ($1000) |
|------------------|---------------|
| 10               | 50            |
| 15               | 65            |
| 20               | 75            |
| 25               | 90            |
| 30               | 95            |

Calculate r to find relationship strength (r ≈ 0.98 - very strong!)

### Simple Linear Regression
**Formulas:**
```
y = mx + b

where:
m = Σ[(xᵢ - x̄)(yᵢ - ȳ)] / Σ(xᵢ - x̄)²  (slope)
b = ȳ - m × x̄  (intercept)
```

**Real-World Example:**
Predicting sales from advertising:

```
x̄ = 20 (average ad spend)
ȳ = 75 (average sales)

m = 2.4 (for every $1,000 in ads, sales increase $2,400)
b = 27 (baseline sales with $0 advertising)

Prediction: y = 2.4x + 27
```

If we spend $12,000 on ads: y = 2.4(12) + 27 = $55,800 in sales

### R-Squared (Coefficient of Determination)
**Formula:**
```
R² = 1 - (SSres / SStot)

where:
SSres = Σ(yᵢ - ŷᵢ)²  (residual sum of squares)
SStot = Σ(yᵢ - ȳ)²   (total sum of squares)
```

**Interpretation:**
- R² = 0.80 means 80% of variance in y is explained by x
- R² = 0.50 means 50% explained (moderate fit)
- R² = 0.20 means 20% explained (weak fit)

---

## 6. Linear Algebra Basics

### Vectors
**Formula:**
```
v = [v₁, v₂, v₃, ..., vₙ]
```

**Real-World Example:**
Customer features: [Age=35, Income=$75K, Years_Customer=5]

### Vector Operations
**Dot Product:**
```
a · b = a₁b₁ + a₂b₂ + ... + aₙbₙ
```

**Real-World Example:**
Calculate weighted score:
- Weights: [0.5, 0.3, 0.2] (importance)
- Scores: [8, 7, 9]

```
Total = 0.5(8) + 0.3(7) + 0.2(9) = 4 + 2.1 + 1.8 = 7.9
```

### Matrices
**Formula:**
```
A = [a₁₁  a₁₂  a₁₃]
    [a₂₁  a₂₂  a₂₃]
    [a₃₁  a₃₂  a₃₃]
```

**Real-World Example:**
Sales data matrix (Products × Quarters):

```
     Q1   Q2   Q3   Q4
A  [100  120  110  130]
B  [ 80   90   85  100]
C  [150  160  155  180]
```

### Matrix Multiplication
**Used in:**
- Multiple linear regression
- Principal Component Analysis (PCA)
- Neural networks

**Real-World Example:**
Converting prices for multiple products in multiple currencies.

---

## 7. Calculus Basics

### Derivative (Rate of Change)
**Formula:**
```
f'(x) = lim[h→0] [f(x+h) - f(x)] / h
```

**Common Derivatives:**
- d/dx(x²) = 2x
- d/dx(x³) = 3x²
- d/dx(eˣ) = eˣ

**Real-World Example:**
Revenue function: R(x) = -2x² + 100x

```
R'(x) = -4x + 100 (marginal revenue)
```

At x = 10 units: R'(10) = -40 + 100 = $60 per additional unit

### Optimization (Finding Maximum/Minimum)
**Process:**
1. Take derivative: f'(x)
2. Set equal to zero: f'(x) = 0
3. Solve for x

**Real-World Example:**
Profit = -3x² + 60x - 100

```
P'(x) = -6x + 60 = 0
6x = 60
x = 10 units
```

Maximum profit occurs at 10 units.

### Partial Derivatives (Multiple Variables)
**Formula:**
```
∂f/∂x = derivative with respect to x (treat other variables as constants)
```

**Real-World Example:**
Sales = 50x + 30y - 2x² - y²
where x = ad spend online, y = ad spend TV

```
∂S/∂x = 50 - 4x (effect of changing online ads)
∂S/∂y = 30 - 2y (effect of changing TV ads)
```

### Gradient Descent (Used in Machine Learning)
**Formula:**
```
xₙ₊₁ = xₙ - α × f'(xₙ)
```
where α = learning rate

**Real-World Example:**
Used to minimize prediction error in regression models by iteratively adjusting parameters.

---

## Quick Reference Cheat Sheet

### When to Use What?

| Task | Use This |
|------|----------|
| Summarize data | Mean, Median, Mode, SD |
| Compare groups | T-test, ANOVA |
| Find relationships | Correlation, Regression |
| Make predictions | Linear/Logistic Regression |
| Classify categories | Chi-square, Logistic Regression |
| Understand distribution | Histograms, Z-scores, Percentiles |
| Estimate population | Confidence Intervals |
| Optimize something | Derivatives, Gradient Descent |
| Reduce dimensions | PCA (uses linear algebra) |

### Common Statistical Thresholds
- **Significance level:** α = 0.05 (p < 0.05 is significant)
- **Confidence level:** 95% (Z = 1.96)
- **Correlation strength:**
  - 0.0-0.3: Weak
  - 0.3-0.7: Moderate
  - 0.7-1.0: Strong

---

## Practice Tips

1. **Start with descriptive statistics** - Get comfortable with mean, median, SD first
2. **Visualize everything** - Plot your data before analyzing
3. **Use real datasets** - Practice with Kaggle, government data, or your own company data
4. **Check assumptions** - Normal distribution? Independent samples?
5. **Interpret, don't just calculate** - Always ask "what does this mean for the business?"

## Tools to Help You
- **Excel/Google Sheets:** Built-in functions like AVERAGE(), STDEV(), CORREL()
- **Python:** pandas, numpy, scipy, statsmodels
- **R:** Built for statistics
- **Calculators:** Many online statistical calculators available

---

Remember: **Math is a tool, not the goal.** Focus on solving business problems and let the math guide your decisions!
