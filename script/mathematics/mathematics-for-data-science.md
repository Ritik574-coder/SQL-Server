# Mathematics for Data Science: A Comprehensive Guide

## Table of Contents
1. [Linear Algebra](#linear-algebra)
2. [Calculus](#calculus)
3. [Probability Theory](#probability-theory)
4. [Statistics](#statistics)
5. [Optimization](#optimization)
6. [Information Theory](#information-theory)
7. [Discrete Mathematics](#discrete-mathematics)

---

## Linear Algebra

Linear algebra is fundamental to data science, particularly for machine learning algorithms, data transformations, and dimensionality reduction.

### Vectors

**Definition**: A vector is an ordered array of numbers representing magnitude and direction.

**Key Concepts**:
- **Vector notation**: v = [v₁, v₂, ..., vₙ]
- **Column vector**: Typically written vertically
- **Row vector**: Written horizontally
- **Vector magnitude (norm)**: ||v|| = √(v₁² + v₂² + ... + vₙ²)

**Operations**:
1. **Addition**: [a₁, a₂] + [b₁, b₂] = [a₁+b₁, a₂+b₂]
2. **Scalar multiplication**: c · [a₁, a₂] = [c·a₁, c·a₂]
3. **Dot product**: a · b = a₁b₁ + a₂b₂ + ... + aₙbₙ
4. **Cross product** (3D): a × b = [a₂b₃-a₃b₂, a₃b₁-a₁b₃, a₁b₂-a₂b₁]

**Applications in Data Science**:
- Representing data points in n-dimensional space
- Computing similarity between documents (cosine similarity)
- Neural network weights and activations

### Matrices

**Definition**: A matrix is a rectangular array of numbers arranged in rows and columns.

**Notation**: A ∈ ℝᵐˣⁿ (m rows, n columns)

**Special Matrices**:
- **Identity matrix (I)**: Diagonal elements are 1, all others are 0
- **Zero matrix**: All elements are 0
- **Diagonal matrix**: Non-zero elements only on the diagonal
- **Symmetric matrix**: A = Aᵀ
- **Orthogonal matrix**: AAᵀ = AᵀA = I

**Matrix Operations**:

1. **Addition/Subtraction**: Element-wise operation
   ```
   [a b]   [e f]   [a+e b+f]
   [c d] + [g h] = [c+g d+h]
   ```

2. **Scalar multiplication**: Multiply each element by scalar
   ```
   k[a b] = [ka kb]
    [c d]   [kc kd]
   ```

3. **Matrix multiplication**: (AB)ᵢⱼ = Σₖ AᵢₖBₖⱼ
   - Note: AB ≠ BA (not commutative)
   - Associative: (AB)C = A(BC)
   - Distributive: A(B+C) = AB + AC

4. **Transpose**: Aᵀ flips rows and columns
   - (Aᵀ)ᵀ = A
   - (AB)ᵀ = BᵀAᵀ

5. **Matrix inverse**: A⁻¹ where AA⁻¹ = A⁻¹A = I
   - Only exists for square matrices with non-zero determinant
   - (AB)⁻¹ = B⁻¹A⁻¹

**Determinant**:
- For 2×2: det([a b; c d]) = ad - bc
- Properties: det(AB) = det(A)det(B)
- Non-zero determinant means matrix is invertible

**Applications in Data Science**:
- Data transformations and feature engineering
- Principal Component Analysis (PCA)
- Linear regression (normal equations)
- Convolutional neural networks

### Eigenvalues and Eigenvectors

**Definition**: For matrix A, vector v is an eigenvector with eigenvalue λ if:
```
Av = λv
```

**Key Properties**:
- Eigenvectors point in directions that are only scaled (not rotated) by the transformation
- Eigenvalues represent the scaling factor
- For n×n matrix, there are n eigenvalues (possibly complex or repeated)

**Computing Eigenvalues**:
1. Solve characteristic equation: det(A - λI) = 0
2. For each λ, solve (A - λI)v = 0 to find eigenvectors

**Applications in Data Science**:
- **PCA**: Find principal components (eigenvectors of covariance matrix)
- **Spectral clustering**: Use eigenvectors of similarity matrix
- **PageRank**: Dominant eigenvector of transition matrix
- **Markov chains**: Steady-state distributions

### Matrix Decompositions

**1. Eigendecomposition**:
```
A = QΛQᵀ
```
- Q: matrix of eigenvectors
- Λ: diagonal matrix of eigenvalues
- Only for square, symmetric matrices

**2. Singular Value Decomposition (SVD)**:
```
A = UΣVᵀ
```
- U: left singular vectors (eigenvectors of AAᵀ)
- Σ: diagonal matrix of singular values
- V: right singular vectors (eigenvectors of AᵀA)
- Works for any m×n matrix

**Applications**:
- Dimensionality reduction
- Recommender systems
- Image compression
- Latent Semantic Analysis (LSA)

**3. LU Decomposition**:
```
A = LU
```
- L: lower triangular matrix
- U: upper triangular matrix
- Used for solving linear systems efficiently

**4. QR Decomposition**:
```
A = QR
```
- Q: orthogonal matrix
- R: upper triangular matrix
- Used in least squares and eigenvalue algorithms

### Vector Spaces

**Key Concepts**:
- **Span**: Set of all linear combinations of vectors
- **Linear independence**: Vectors are linearly independent if no vector can be written as a combination of others
- **Basis**: Linearly independent set that spans the space
- **Dimension**: Number of vectors in a basis
- **Rank**: Dimension of column space (or row space)
- **Null space**: Set of vectors x where Ax = 0

**Applications in Data Science**:
- Understanding feature spaces
- Dimensionality reduction
- Feature selection and redundancy detection

---

## Calculus

Calculus is essential for understanding optimization algorithms, gradient descent, and how machine learning models learn.

### Limits and Continuity

**Limit Definition**:
```
lim(x→a) f(x) = L
```
The value f(x) approaches as x approaches a.

**Key Concepts**:
- One-sided limits: lim(x→a⁺) and lim(x→a⁻)
- Limit exists if left and right limits are equal
- Continuity: f is continuous at a if lim(x→a) f(x) = f(a)

**Important Limits**:
- lim(x→0) (sin x)/x = 1
- lim(x→∞) (1 + 1/x)ˣ = e
- lim(x→0) (eˣ - 1)/x = 1

### Derivatives (Single Variable)

**Definition**:
```
f'(x) = lim(h→0) [f(x+h) - f(x)]/h
```

**Interpretation**:
- Rate of change
- Slope of tangent line
- Instantaneous velocity

**Basic Derivative Rules**:
1. Power rule: d/dx(xⁿ) = nxⁿ⁻¹
2. Constant rule: d/dx(c) = 0
3. Sum rule: d/dx(f + g) = f' + g'
4. Product rule: d/dx(fg) = f'g + fg'
5. Quotient rule: d/dx(f/g) = (f'g - fg')/g²
6. Chain rule: d/dx(f(g(x))) = f'(g(x))·g'(x)

**Common Derivatives**:
- d/dx(eˣ) = eˣ
- d/dx(ln x) = 1/x
- d/dx(sin x) = cos x
- d/dx(cos x) = -sin x
- d/dx(tan x) = sec²x
- d/dx(aˣ) = aˣ ln a
- d/dx(logₐ x) = 1/(x ln a)

**Applications in Data Science**:
- Gradient descent optimization
- Backpropagation in neural networks
- Finding maxima/minima of loss functions

### Partial Derivatives (Multivariable)

**Definition**: For f(x, y), the partial derivative with respect to x is:
```
∂f/∂x = lim(h→0) [f(x+h, y) - f(x, y)]/h
```

**Notation**:
- ∂f/∂x or fₓ
- Treat other variables as constants

**Example**:
If f(x, y) = x²y + 3xy², then:
- ∂f/∂x = 2xy + 3y²
- ∂f/∂y = x² + 6xy

**Gradient**:
The gradient ∇f is a vector of all partial derivatives:
```
∇f = [∂f/∂x₁, ∂f/∂x₂, ..., ∂f/∂xₙ]
```

**Properties**:
- Points in direction of steepest ascent
- Perpendicular to level curves/surfaces
- Magnitude represents rate of steepest increase

**Applications in Data Science**:
- Gradient descent: θ = θ - α∇J(θ)
- Optimizing neural networks
- Feature importance analysis

### Gradient, Jacobian, and Hessian

**1. Gradient** (scalar function → vector):
```
∇f(x) = [∂f/∂x₁, ∂f/∂x₂, ..., ∂f/∂xₙ]ᵀ
```

**2. Jacobian** (vector function → matrix):
For f: ℝⁿ → ℝᵐ, the Jacobian J is m×n:
```
J = [∂f₁/∂x₁  ∂f₁/∂x₂  ...  ∂f₁/∂xₙ]
    [∂f₂/∂x₁  ∂f₂/∂x₂  ...  ∂f₂/∂xₙ]
    [   ⋮         ⋮      ⋱      ⋮    ]
    [∂fₘ/∂x₁  ∂fₘ/∂x₂  ...  ∂fₘ/∂xₙ]
```

**3. Hessian** (second derivatives of scalar function):
For f: ℝⁿ → ℝ, the Hessian H is n×n:
```
H = [∂²f/∂x₁²    ∂²f/∂x₁∂x₂  ...  ∂²f/∂x₁∂xₙ]
    [∂²f/∂x₂∂x₁  ∂²f/∂x₂²    ...  ∂²f/∂x₂∂xₙ]
    [    ⋮            ⋮       ⋱        ⋮     ]
    [∂²f/∂xₙ∂x₁  ∂²f/∂xₙ∂x₂  ...  ∂²f/∂xₙ²  ]
```

**Applications**:
- Jacobian: Backpropagation through layers
- Hessian: Newton's method, checking convexity
- Second-order optimization methods

### Integration

**Definite Integral**:
```
∫ₐᵇ f(x)dx = F(b) - F(a)
```
where F'(x) = f(x)

**Interpretation**:
- Area under curve
- Total accumulation
- Reverse of differentiation

**Basic Integration Rules**:
1. Power rule: ∫xⁿdx = xⁿ⁺¹/(n+1) + C (n ≠ -1)
2. Constant multiple: ∫cf(x)dx = c∫f(x)dx
3. Sum rule: ∫[f(x) + g(x)]dx = ∫f(x)dx + ∫g(x)dx
4. Substitution: If u = g(x), then ∫f(g(x))g'(x)dx = ∫f(u)du
5. Integration by parts: ∫udv = uv - ∫vdu

**Common Integrals**:
- ∫eˣdx = eˣ + C
- ∫(1/x)dx = ln|x| + C
- ∫sin x dx = -cos x + C
- ∫cos x dx = sin x + C
- ∫1/(1+x²)dx = arctan x + C

**Multiple Integrals**:
```
∬_R f(x,y)dA = ∫ₐᵇ∫_c^d f(x,y)dy dx
```

**Applications in Data Science**:
- Computing probabilities (integration of PDFs)
- Expected values and variance
- Area under ROC curve (AUC)
- Continuous loss functions

### Taylor Series

**Definition**: Approximation of function around point a:
```
f(x) = f(a) + f'(a)(x-a) + f''(a)(x-a)²/2! + f'''(a)(x-a)³/3! + ...
```

**Maclaurin Series** (a = 0):
```
f(x) = f(0) + f'(0)x + f''(0)x²/2! + f'''(0)x³/3! + ...
```

**Common Series**:
- eˣ = 1 + x + x²/2! + x³/3! + ...
- sin x = x - x³/3! + x⁵/5! - ...
- cos x = 1 - x²/2! + x⁴/4! - ...
- ln(1+x) = x - x²/2 + x³/3 - ... (|x| < 1)

**Applications in Data Science**:
- Approximating activation functions
- Understanding convergence of algorithms
- Deriving numerical methods

### Chain Rule for Multivariable Functions

**Single Path**:
If z = f(x, y) where x = g(t) and y = h(t):
```
dz/dt = (∂f/∂x)(dx/dt) + (∂f/∂y)(dy/dt)
```

**General Chain Rule**:
For composite functions, multiply partial derivatives along each path and sum.

**Applications in Data Science**:
- **Backpropagation**: Core of training neural networks
- Computing gradients through complex computational graphs
- Automatic differentiation

---

## Probability Theory

Probability theory provides the mathematical foundation for dealing with uncertainty in data science.

### Basic Probability

**Sample Space (S)**: Set of all possible outcomes
**Event (E)**: Subset of sample space
**Probability**: P(E) ∈ [0, 1]

**Axioms of Probability**:
1. P(E) ≥ 0 for any event E
2. P(S) = 1 (something must happen)
3. For mutually exclusive events: P(E₁ ∪ E₂) = P(E₁) + P(E₂)

**Basic Rules**:
- **Complement**: P(Aᶜ) = 1 - P(A)
- **Addition rule**: P(A ∪ B) = P(A) + P(B) - P(A ∩ B)
- **Multiplication rule** (independent): P(A ∩ B) = P(A)·P(B)

### Conditional Probability

**Definition**:
```
P(A|B) = P(A ∩ B) / P(B)
```
Probability of A given B has occurred.

**Multiplication Rule**:
```
P(A ∩ B) = P(A|B)·P(B) = P(B|A)·P(A)
```

**Independence**:
Events A and B are independent if:
```
P(A|B) = P(A)  or  P(A ∩ B) = P(A)·P(B)
```

### Bayes' Theorem

**Formula**:
```
P(A|B) = P(B|A)·P(A) / P(B)
```

**Extended Form**:
```
P(A|B) = P(B|A)·P(A) / [P(B|A)·P(A) + P(B|Aᶜ)·P(Aᶜ)]
```

**Terminology**:
- P(A): Prior probability
- P(A|B): Posterior probability
- P(B|A): Likelihood
- P(B): Evidence/marginal likelihood

**Applications in Data Science**:
- Naive Bayes classifier
- Bayesian inference
- Spam filtering
- Medical diagnosis
- A/B testing

### Random Variables

**Definition**: A function that maps outcomes to real numbers.

**Types**:
1. **Discrete**: Countable values (e.g., number of heads in coin flips)
2. **Continuous**: Uncountable values (e.g., height, temperature)

**Probability Mass Function (PMF)** (discrete):
```
pₓ(x) = P(X = x)
```
Properties: pₓ(x) ≥ 0, Σ pₓ(x) = 1

**Probability Density Function (PDF)** (continuous):
```
P(a ≤ X ≤ b) = ∫ₐᵇ fₓ(x)dx
```
Properties: fₓ(x) ≥ 0, ∫₋∞^∞ fₓ(x)dx = 1

**Cumulative Distribution Function (CDF)**:
```
Fₓ(x) = P(X ≤ x)
```
- For discrete: Fₓ(x) = Σ_{t≤x} pₓ(t)
- For continuous: Fₓ(x) = ∫_{-∞}^x fₓ(t)dt

### Expected Value and Variance

**Expected Value (Mean)**:
- Discrete: E[X] = Σ x·pₓ(x)
- Continuous: E[X] = ∫₋∞^∞ x·fₓ(x)dx

**Properties**:
- E[aX + b] = aE[X] + b
- E[X + Y] = E[X] + E[Y]
- E[XY] = E[X]·E[Y] (if independent)

**Variance**:
```
Var(X) = E[(X - μ)²] = E[X²] - (E[X])²
```

**Standard Deviation**:
```
σ = √Var(X)
```

**Properties**:
- Var(aX + b) = a²Var(X)
- Var(X + Y) = Var(X) + Var(Y) (if independent)

**Covariance**:
```
Cov(X, Y) = E[(X - E[X])(Y - E[Y])] = E[XY] - E[X]E[Y]
```

**Correlation**:
```
ρ(X, Y) = Cov(X, Y) / (σₓσᵧ)
```
Range: [-1, 1]

### Common Probability Distributions

**1. Bernoulli Distribution** (single trial, binary outcome):
- Parameter: p (probability of success)
- PMF: P(X = 1) = p, P(X = 0) = 1-p
- E[X] = p, Var(X) = p(1-p)

**2. Binomial Distribution** (n independent Bernoulli trials):
- Parameters: n (trials), p (success probability)
- PMF: P(X = k) = C(n,k)pᵏ(1-p)ⁿ⁻ᵏ
- E[X] = np, Var(X) = np(1-p)

**3. Poisson Distribution** (count of events in fixed interval):
- Parameter: λ (rate)
- PMF: P(X = k) = (λᵏe⁻ᵏ)/k!
- E[X] = λ, Var(X) = λ
- Used for: rare events, arrivals, defects

**4. Uniform Distribution** (continuous):
- Parameters: a, b (bounds)
- PDF: f(x) = 1/(b-a) for x ∈ [a,b]
- E[X] = (a+b)/2, Var(X) = (b-a)²/12

**5. Normal (Gaussian) Distribution**:
- Parameters: μ (mean), σ² (variance)
- PDF: f(x) = (1/√(2πσ²))·exp(-(x-μ)²/(2σ²))
- E[X] = μ, Var(X) = σ²
- Standard normal: μ = 0, σ = 1

**Properties**:
- Symmetric around mean
- 68-95-99.7 rule (empirical rule)
- Central Limit Theorem foundation

**6. Exponential Distribution** (time until event):
- Parameter: λ (rate)
- PDF: f(x) = λe⁻ᵏˣ for x ≥ 0
- E[X] = 1/λ, Var(X) = 1/λ²
- Memoryless property

**7. Beta Distribution** (bounded continuous):
- Parameters: α, β (shape)
- PDF: f(x) = xᵅ⁻¹(1-x)ᵝ⁻¹/B(α,β) for x ∈ [0,1]
- E[X] = α/(α+β)
- Used for: probabilities, proportions

**8. Gamma Distribution**:
- Parameters: k (shape), θ (scale)
- PDF: f(x) = xᵏ⁻¹e⁻ˣ/ᶿ/(θᵏΓ(k))
- E[X] = kθ, Var(X) = kθ²

### Law of Large Numbers and Central Limit Theorem

**Law of Large Numbers**:
As n → ∞, the sample mean converges to the expected value:
```
(X₁ + X₂ + ... + Xₙ)/n → E[X]
```

**Central Limit Theorem (CLT)**:
For i.i.d. random variables with mean μ and variance σ²:
```
(X̄ₙ - μ)/(σ/√n) → N(0, 1) as n → ∞
```

**Implications**:
- Sample means are approximately normal for large n
- Enables confidence intervals and hypothesis testing
- Foundation for many statistical methods

**Applications in Data Science**:
- Justification for using normal distribution
- Bootstrap methods
- Confidence interval construction
- A/B testing

### Joint, Marginal, and Conditional Distributions

**Joint Distribution**:
- Discrete: P(X = x, Y = y)
- Continuous: f(x, y)

**Marginal Distribution**:
- From joint: P(X = x) = Σᵧ P(X = x, Y = y)
- Continuous: fₓ(x) = ∫ f(x,y)dy

**Conditional Distribution**:
```
P(X = x | Y = y) = P(X = x, Y = y) / P(Y = y)
```

**Independence**:
X and Y are independent if:
```
f(x, y) = fₓ(x)·fᵧ(y)
```

### Maximum Likelihood Estimation (MLE)

**Concept**: Find parameter values that maximize the likelihood of observing the data.

**Likelihood Function**:
```
L(θ|data) = P(data|θ)
```

**Log-Likelihood**:
```
ℓ(θ) = log L(θ) = Σᵢ log P(xᵢ|θ)
```

**MLE Procedure**:
1. Write likelihood function
2. Take logarithm (simplifies calculation)
3. Take derivative with respect to parameters
4. Set equal to zero and solve

**Example** (Normal distribution):
For data x₁, ..., xₙ ~ N(μ, σ²):
- MLE for μ: μ̂ = (1/n)Σxᵢ (sample mean)
- MLE for σ²: σ̂² = (1/n)Σ(xᵢ - μ̂)²

**Applications in Data Science**:
- Parameter estimation in statistical models
- Training logistic regression
- Fitting probability distributions

---

## Statistics

Statistics involves collecting, analyzing, interpreting, and presenting data.

### Descriptive Statistics

**Measures of Central Tendency**:

1. **Mean** (average):
   ```
   μ = (1/n)Σxᵢ
   ```

2. **Median**: Middle value when sorted
   - Less sensitive to outliers than mean
   - For even n, average of two middle values

3. **Mode**: Most frequent value
   - Can have multiple modes
   - Useful for categorical data

**Measures of Dispersion**:

1. **Range**: max - min

2. **Variance**:
   ```
   σ² = (1/n)Σ(xᵢ - μ)²  (population)
   s² = (1/(n-1))Σ(xᵢ - x̄)²  (sample)
   ```

3. **Standard Deviation**: σ = √variance

4. **Interquartile Range (IQR)**: Q₃ - Q₁
   - Robust to outliers
   - Contains middle 50% of data

5. **Mean Absolute Deviation**:
   ```
   MAD = (1/n)Σ|xᵢ - μ|
   ```

**Measures of Shape**:

1. **Skewness**: Measure of asymmetry
   - Positive: right-tailed
   - Negative: left-tailed
   - Zero: symmetric

2. **Kurtosis**: Measure of tail heaviness
   - High: heavy tails, sharp peak
   - Low: light tails, flat peak

**Quantiles and Percentiles**:
- **Quartiles**: Q₁ (25th), Q₂ (50th/median), Q₃ (75th)
- **Percentiles**: P(k) = kth percentile
- **Deciles**: 10%, 20%, ..., 90%

### Sampling and Sampling Distributions

**Population vs Sample**:
- Population: Entire group of interest
- Sample: Subset of population

**Sampling Methods**:
1. **Simple Random Sampling**: Each item has equal probability
2. **Stratified Sampling**: Divide into groups, sample from each
3. **Cluster Sampling**: Randomly select clusters, sample all within
4. **Systematic Sampling**: Every kth item
5. **Convenience Sampling**: Easily accessible items (may be biased)

**Sample Statistics**:
- Sample mean: X̄ = (1/n)Σxᵢ
- Sample variance: s² = (1/(n-1))Σ(xᵢ - X̄)²
- Sample proportion: p̂ = x/n

**Sampling Distribution**:
Distribution of a statistic over all possible samples.

**Standard Error**:
Standard deviation of sampling distribution:
```
SE(X̄) = σ/√n
```

### Confidence Intervals

**Definition**: Range likely to contain true parameter with specified confidence level.

**Confidence Interval for Mean** (known σ):
```
X̄ ± z*·(σ/√n)
```
where z* is critical value from standard normal.

**Common confidence levels**:
- 90%: z* = 1.645
- 95%: z* = 1.96
- 99%: z* = 2.576

**Confidence Interval for Mean** (unknown σ, use t-distribution):
```
X̄ ± t*·(s/√n)
```
where t* from t-distribution with (n-1) degrees of freedom.

**Confidence Interval for Proportion**:
```
p̂ ± z*·√[p̂(1-p̂)/n]
```

**Interpretation**:
If we repeated sampling many times, approximately C% of intervals would contain the true parameter.

### Hypothesis Testing

**Framework**:
1. State null hypothesis (H₀) and alternative hypothesis (H₁)
2. Choose significance level α (commonly 0.05)
3. Calculate test statistic
4. Determine p-value
5. Make decision: reject H₀ if p-value < α

**Null Hypothesis (H₀)**: Statement of no effect/no difference
**Alternative Hypothesis (H₁)**: What we're testing for

**Types of Tests**:
- **One-tailed**: H₁: μ > μ₀ or μ < μ₀
- **Two-tailed**: H₁: μ ≠ μ₀

**P-value**: Probability of observing data at least as extreme as what we got, assuming H₀ is true.

**Decision Rules**:
- If p-value < α: Reject H₀ (statistically significant)
- If p-value ≥ α: Fail to reject H₀ (not statistically significant)

**Types of Errors**:
- **Type I Error**: Reject H₀ when it's true (false positive)
  - P(Type I) = α (significance level)
- **Type II Error**: Fail to reject H₀ when it's false (false negative)
  - P(Type II) = β
- **Power**: 1 - β (probability of correctly rejecting false H₀)

### Common Statistical Tests

**1. Z-test** (mean, known σ, large n):
```
z = (X̄ - μ₀)/(σ/√n)
```

**2. t-test** (mean, unknown σ, small n):
```
t = (X̄ - μ₀)/(s/√n)
```
Degrees of freedom: n - 1

**3. Two-sample t-test** (comparing two means):
```
t = (X̄₁ - X̄₂)/√[s₁²/n₁ + s₂²/n₂]
```

**4. Paired t-test** (matched pairs):
```
t = (d̄)/(s_d/√n)
```
where d̄ is mean of differences.

**5. Chi-square test** (categorical data):
- **Goodness of fit**: Does data match expected distribution?
- **Test of independence**: Are two variables independent?
```
χ² = Σ(Observed - Expected)²/Expected
```

**6. ANOVA** (comparing multiple means):
- Tests if means of ≥3 groups are equal
- F-statistic compares between-group to within-group variance

**7. Correlation test**:
Tests if correlation is significantly different from zero.

### Regression Analysis

**Simple Linear Regression**:
```
y = β₀ + β₁x + ε
```

**Least Squares Estimation**:
Minimize: Σ(yᵢ - ŷᵢ)²

**Coefficients**:
```
β₁ = Σ(xᵢ - x̄)(yᵢ - ȳ) / Σ(xᵢ - x̄)²
β₀ = ȳ - β₁x̄
```

**Multiple Linear Regression**:
```
y = β₀ + β₁x₁ + β₂x₂ + ... + βₚxₚ + ε
```

**Matrix Form**:
```
y = Xβ + ε
β̂ = (XᵀX)⁻¹Xᵀy  (normal equations)
```

**Model Evaluation**:

1. **R² (Coefficient of Determination)**:
   ```
   R² = 1 - SS_res/SS_tot
   ```
   - Range: [0, 1]
   - Proportion of variance explained

2. **Adjusted R²**:
   ```
   R²_adj = 1 - [(1-R²)(n-1)/(n-p-1)]
   ```
   - Penalizes for additional predictors

3. **Mean Squared Error (MSE)**:
   ```
   MSE = (1/n)Σ(yᵢ - ŷᵢ)²
   ```

4. **Root Mean Squared Error (RMSE)**:
   ```
   RMSE = √MSE
   ```

**Assumptions**:
1. Linearity
2. Independence of errors
3. Homoscedasticity (constant variance)
4. Normality of errors
5. No multicollinearity (for multiple regression)

**Diagnostics**:
- Residual plots
- Q-Q plots (normality)
- Leverage and influence measures
- Variance Inflation Factor (VIF) for multicollinearity

### ANOVA (Analysis of Variance)

**Purpose**: Compare means across multiple groups.

**Hypotheses**:
- H₀: μ₁ = μ₂ = ... = μₖ
- H₁: At least one mean is different

**F-statistic**:
```
F = (Between-group variance) / (Within-group variance)
```

**Sources of Variation**:
- **SST** (Total Sum of Squares): Σ(yᵢⱼ - ȳ)²
- **SSB** (Between-group): Σnⱼ(ȳⱼ - ȳ)²
- **SSW** (Within-group): ΣΣ(yᵢⱼ - ȳⱼ)²
- SST = SSB + SSW

**Degrees of Freedom**:
- Total: n - 1
- Between: k - 1
- Within: n - k

**Mean Squares**:
- MSB = SSB/(k-1)
- MSW = SSW/(n-k)
- F = MSB/MSW

**Post-hoc Tests** (if F is significant):
- Tukey's HSD
- Bonferroni correction
- Scheffé's method

### Nonparametric Tests

Used when data doesn't meet parametric test assumptions.

**1. Mann-Whitney U test** (two independent samples):
- Alternative to two-sample t-test
- Compares medians/ranks

**2. Wilcoxon Signed-Rank test** (paired samples):
- Alternative to paired t-test

**3. Kruskal-Wallis test** (multiple groups):
- Alternative to ANOVA

**4. Spearman's Rank Correlation**:
- Alternative to Pearson correlation
- Measures monotonic relationships

**5. Friedman test** (repeated measures):
- Alternative to repeated-measures ANOVA

### Experimental Design

**Key Concepts**:
1. **Randomization**: Random assignment to groups
2. **Replication**: Multiple observations
3. **Control**: Control variables and comparison groups
4. **Blocking**: Group similar units

**Types of Designs**:
1. **Completely Randomized Design**: Random assignment to treatments
2. **Randomized Block Design**: Block by confounding variable
3. **Factorial Design**: Multiple factors simultaneously
4. **Repeated Measures**: Same subjects under different conditions

**A/B Testing**:
- Randomly assign users to variants
- Compare metrics between groups
- Calculate statistical significance

---

## Optimization

Optimization is central to training machine learning models and finding optimal solutions.

### Unconstrained Optimization

**Problem**: Find x that minimizes (or maximizes) f(x).

**Necessary Condition** (first-order):
At minimum x*, ∇f(x*) = 0

**Sufficient Condition** (second-order):
- At minimum: Hessian is positive definite
- At maximum: Hessian is negative definite

**Convexity**:
Function f is convex if:
```
f(λx + (1-λ)y) ≤ λf(x) + (1-λ)f(y)
```
for all x, y and λ ∈ [0,1].

**Properties of Convex Functions**:
- Any local minimum is a global minimum
- Gradient descent converges to global optimum
- Easier to optimize

### Gradient Descent

**Basic Algorithm**:
```
Repeat until convergence:
    θ := θ - α·∇J(θ)
```
where α is the learning rate.

**Variants**:

**1. Batch Gradient Descent**:
- Use entire dataset for each update
- Accurate but slow for large datasets

**2. Stochastic Gradient Descent (SGD)**:
- Use single random sample for each update
- Fast but noisy
```
θ := θ - α·∇J(θ; xᵢ, yᵢ)
```

**3. Mini-batch Gradient Descent**:
- Use small batch of samples
- Balance between batch and SGD
- Most commonly used in practice

**Challenges**:
- Choosing learning rate
- Local minima (for non-convex functions)
- Saddle points
- Ill-conditioning

**Improvements**:

**1. Momentum**:
```
v := βv + ∇J(θ)
θ := θ - α·v
```
- Accelerates convergence
- Reduces oscillation

**2. Nesterov Accelerated Gradient**:
- Look-ahead version of momentum
- Computes gradient at future position

**3. AdaGrad**:
- Adapts learning rate per parameter
- Good for sparse data
```
θᵢ := θᵢ - α/(√Gᵢᵢ + ε)·∇J(θᵢ)
```
where Gᵢᵢ is sum of squared gradients.

**4. RMSprop**:
- Uses moving average of squared gradients
- Fixes AdaGrad's diminishing learning rate

**5. Adam** (Adaptive Moment Estimation):
- Combines momentum and RMSprop
- Most popular optimizer
```
m := β₁m + (1-β₁)∇J(θ)  (first moment)
v := β₂v + (1-β₂)(∇J(θ))²  (second moment)
θ := θ - α·m̂/√(v̂ + ε)
```

### Newton's Method

**Algorithm**:
```
θ := θ - H⁻¹·∇J(θ)
```
where H is the Hessian matrix.

**Advantages**:
- Quadratic convergence near optimum
- No learning rate needed

**Disadvantages**:
- Computing Hessian is expensive: O(n²) space, O(n³) time
- May not converge if Hessian is not positive definite
- Impractical for high dimensions

**Quasi-Newton Methods** (approximate Hessian):
- BFGS (Broyden-Fletcher-Goldfarb-Shanno)
- L-BFGS (Limited-memory BFGS)

### Constrained Optimization

**Problem**:
```
minimize f(x)
subject to: gᵢ(x) ≤ 0  (inequality constraints)
            hⱼ(x) = 0  (equality constraints)
```

**Lagrangian**:
```
L(x, λ, μ) = f(x) + Σλᵢgᵢ(x) + Σμⱼhⱼ(x)
```
where λ, μ are Lagrange multipliers.

**KKT Conditions** (Karush-Kuhn-Tucker):
Necessary conditions for optimality:
1. ∇f(x*) + Σλᵢ∇gᵢ(x*) + Σμⱼ∇hⱼ(x*) = 0
2. gᵢ(x*) ≤ 0 for all i
3. λᵢ ≥ 0 for all i
4. λᵢgᵢ(x*) = 0 for all i (complementary slackness)
5. hⱼ(x*) = 0 for all j

**Applications in Data Science**:
- Support Vector Machines (SVMs)
- Constrained neural networks
- Portfolio optimization
- Resource allocation

### Convex Optimization

**Linear Programming**:
```
minimize cᵀx
subject to: Ax ≤ b, x ≥ 0
```

**Quadratic Programming**:
```
minimize (1/2)xᵀQx + cᵀx
subject to: Ax ≤ b
```

**Applications**:
- Linear regression (least squares)
- Support Vector Machines
- Portfolio optimization
- LASSO and Ridge regression

### Regularization

**Purpose**: Prevent overfitting by adding penalty term.

**L2 Regularization (Ridge)**:
```
J(θ) = Loss(θ) + λ·||θ||₂²
```
- Shrinks coefficients toward zero
- Doesn't eliminate features

**L1 Regularization (LASSO)**:
```
J(θ) = Loss(θ) + λ·||θ||₁
```
- Can set coefficients exactly to zero
- Performs feature selection

**Elastic Net** (combination):
```
J(θ) = Loss(θ) + λ₁·||θ||₁ + λ₂·||θ||₂²
```

**Effect on Gradient**:
- L2: ∇J(θ) = ∇Loss(θ) + 2λθ
- L1: ∇J(θ) = ∇Loss(θ) + λ·sign(θ)

---

## Information Theory

Information theory provides mathematical tools for quantifying information and uncertainty.

### Entropy

**Shannon Entropy**:
For discrete random variable X:
```
H(X) = -Σ P(x)·log₂ P(x)
```

**Interpretation**:
- Average information content
- Measure of uncertainty
- Minimum bits needed to encode X

**Properties**:
- H(X) ≥ 0
- H(X) = 0 if X is deterministic
- H(X) is maximized for uniform distribution
- H(X₁, X₂) ≤ H(X₁) + H(X₂) (subadditivity)

**Conditional Entropy**:
```
H(Y|X) = Σ P(x)·H(Y|X=x)
```
Average uncertainty in Y given X.

**Joint Entropy**:
```
H(X, Y) = H(X) + H(Y|X) = H(Y) + H(X|Y)
```

**Applications in Data Science**:
- Decision tree splitting criteria
- Feature selection
- Measuring model uncertainty

### Cross-Entropy

**Definition**:
```
H(p, q) = -Σ p(x)·log q(x)
```
where p is true distribution, q is predicted distribution.

**Interpretation**:
Average number of bits needed to encode data from p using code optimized for q.

**Properties**:
- H(p, q) ≥ H(p)
- H(p, q) = H(p) only if p = q

**Applications in Data Science**:
- Loss function for classification (cross-entropy loss)
- Training neural networks
- Evaluating probability predictions

### Kullback-Leibler (KL) Divergence

**Definition**:
```
D_KL(p||q) = Σ p(x)·log[p(x)/q(x)]
          = H(p, q) - H(p)
```

**Interpretation**:
- Measures how different q is from p
- Extra bits needed when using q instead of p
- "Distance" between distributions (not symmetric)

**Properties**:
- D_KL(p||q) ≥ 0
- D_KL(p||q) = 0 if and only if p = q
- Not symmetric: D_KL(p||q) ≠ D_KL(q||p)
- Not a true metric (doesn't satisfy triangle inequality)

**Applications in Data Science**:
- Variational inference
- Variational Autoencoders (VAEs)
- Model comparison
- Information bottleneck

### Mutual Information

**Definition**:
```
I(X; Y) = H(X) + H(Y) - H(X, Y)
        = H(X) - H(X|Y)
        = D_KL(p(x,y) || p(x)p(y))
```

**Interpretation**:
- Reduction in uncertainty about X when Y is known
- Amount of information shared between X and Y
- Zero if and only if X and Y are independent

**Properties**:
- I(X; Y) ≥ 0
- I(X; Y) = I(Y; X) (symmetric)
- I(X; X) = H(X)
- I(X; Y) ≤ min(H(X), H(Y))

**Applications in Data Science**:
- Feature selection
- Variable importance
- Clustering evaluation
- Network analysis

---

## Discrete Mathematics

Discrete mathematics provides tools for working with discrete structures common in computer science and data science.

### Set Theory

**Basic Definitions**:
- **Set**: Collection of distinct objects
- **Element**: Object in a set (x ∈ A)
- **Subset**: A ⊆ B if every element of A is in B
- **Empty set**: ∅ (set with no elements)
- **Universal set**: U (all elements under consideration)

**Set Operations**:
1. **Union**: A ∪ B = {x : x ∈ A or x ∈ B}
2. **Intersection**: A ∩ B = {x : x ∈ A and x ∈ B}
3. **Difference**: A - B = {x : x ∈ A and x ∉ B}
4. **Complement**: A' = {x : x ∉ A}
5. **Cartesian Product**: A × B = {(a,b) : a ∈ A, b ∈ B}

**Properties**:
- Commutative: A ∪ B = B ∪ A
- Associative: (A ∪ B) ∪ C = A ∪ (B ∪ C)
- Distributive: A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C)
- De Morgan's Laws:
  - (A ∪ B)' = A' ∩ B'
  - (A ∩ B)' = A' ∪ B'

**Cardinality**:
- |A|: number of elements in A
- |A ∪ B| = |A| + |B| - |A ∩ B|

### Combinatorics

**Fundamental Counting Principle**:
If task 1 can be done in n₁ ways and task 2 in n₂ ways, both can be done in n₁ × n₂ ways.

**Permutations** (order matters):
```
P(n, r) = n!/(n-r)!
```
Number of ways to arrange r items from n items.

**Combinations** (order doesn't matter):
```
C(n, r) = n!/(r!(n-r)!) = (n choose r)
```
Number of ways to choose r items from n items.

**Properties**:
- C(n, r) = C(n, n-r)
- C(n, r) = C(n-1, r-1) + C(n-1, r) (Pascal's identity)

**Binomial Theorem**:
```
(a + b)ⁿ = Σ C(n,k)·aⁿ⁻ᵏ·bᵏ
```

**Applications in Data Science**:
- Counting possible outcomes
- Sampling without replacement
- Hyperparameter grid search
- Cross-validation splits

### Graph Theory

**Graph**: G = (V, E) where V is vertices, E is edges.

**Types of Graphs**:
- **Undirected**: Edges have no direction
- **Directed (Digraph)**: Edges have direction
- **Weighted**: Edges have weights
- **Complete**: Every pair of vertices connected
- **Bipartite**: Vertices in two disjoint sets

**Graph Properties**:
- **Degree**: Number of edges connected to vertex
- **Path**: Sequence of vertices connected by edges
- **Cycle**: Path that starts and ends at same vertex
- **Connected**: Path exists between any two vertices
- **Tree**: Connected graph with no cycles

**Graph Representations**:
1. **Adjacency Matrix**: A[i][j] = 1 if edge exists
2. **Adjacency List**: List of neighbors for each vertex
3. **Edge List**: List of all edges

**Common Algorithms**:
- **Breadth-First Search (BFS)**: Level-by-level exploration
- **Depth-First Search (DFS)**: Explore as deep as possible
- **Dijkstra's Algorithm**: Shortest path (weighted)
- **PageRank**: Importance of nodes

**Applications in Data Science**:
- Social network analysis
- Recommendation systems
- Knowledge graphs
- Neural network architectures
- Dependency modeling

### Logic and Boolean Algebra

**Logical Operators**:
- **AND** (∧): True if both true
- **OR** (∨): True if at least one true
- **NOT** (¬): Negates truth value
- **XOR** (⊕): True if exactly one true
- **IMPLIES** (→): False only if antecedent true and consequent false
- **IFF** (↔): True if both have same truth value

**Truth Tables**: Define logical operations

**Laws**:
- **Identity**: A ∧ T = A, A ∨ F = A
- **Domination**: A ∧ F = F, A ∨ T = T
- **Idempotent**: A ∧ A = A, A ∨ A = A
- **Complement**: A ∧ ¬A = F, A ∨ ¬A = T
- **De Morgan's**: ¬(A ∧ B) = ¬A ∨ ¬B

**Applications in Data Science**:
- Feature engineering (boolean features)
- Query processing
- Rule-based systems
- Logical reasoning in AI

### Recurrence Relations

**Definition**: Equation that defines sequence based on previous terms.

**Example**: Fibonacci sequence
```
F(n) = F(n-1) + F(n-2)
F(0) = 0, F(1) = 1
```

**Linear Recurrence**:
```
aₙ = c₁aₙ₋₁ + c₂aₙ₋₂ + ... + cₖaₙ₋ₖ
```

**Solving Methods**:
1. **Characteristic equation**
2. **Generating functions**
3. **Iteration method**
4. **Master theorem** (divide-and-conquer)

**Applications in Data Science**:
- Algorithm analysis (time complexity)
- Dynamic programming
- Sequence modeling
- Time series analysis

### Asymptotic Notation

**Big O** (upper bound):
f(n) = O(g(n)) if f(n) ≤ c·g(n) for large n

**Big Ω** (lower bound):
f(n) = Ω(g(n)) if f(n) ≥ c·g(n) for large n

**Big Θ** (tight bound):
f(n) = Θ(g(n)) if both O and Ω

**Common Complexities** (from fastest to slowest):
- O(1): Constant
- O(log n): Logarithmic
- O(n): Linear
- O(n log n): Linearithmic
- O(n²): Quadratic
- O(n³): Cubic
- O(2ⁿ): Exponential
- O(n!): Factorial

**Applications in Data Science**:
- Algorithm selection
- Scalability analysis
- Performance optimization
- Understanding model training time

---

## Practical Applications Summary

### Machine Learning Foundations

**Linear Algebra**:
- Neural network operations (matrix multiplication)
- PCA and dimensionality reduction
- SVD for recommender systems
- Computing similarities

**Calculus**:
- Gradient descent optimization
- Backpropagation
- Understanding convergence
- Sensitivity analysis

**Probability & Statistics**:
- Probabilistic models (Naive Bayes, HMMs)
- Uncertainty quantification
- Hypothesis testing for model comparison
- Cross-validation

**Optimization**:
- Training all ML models
- Hyperparameter tuning
- Regularization techniques
- Constrained optimization (SVM)

### Deep Learning Specifics

**Essential Math**:
- Chain rule → backpropagation
- Matrix operations → layer computations
- Probability distributions → loss functions
- Information theory → regularization (dropout, KL divergence)
- Convex optimization → training strategies

### Data Analysis

**Statistical Inference**:
- A/B testing
- Confidence intervals
- Hypothesis testing
- Regression analysis

**Exploratory Data Analysis**:
- Descriptive statistics
- Correlation analysis
- Distribution fitting
- Outlier detection

### Natural Language Processing

**Key Areas**:
- Probability (language models)
- Information theory (entropy, perplexity)
- Linear algebra (word embeddings)
- Graph theory (dependency parsing)

### Computer Vision

**Key Areas**:
- Linear algebra (image transformations)
- Calculus (edge detection, gradients)
- Probability (generative models)
- Optimization (feature learning)

---

## Study Tips and Resources

### Learning Path

**Foundation (Start Here)**:
1. Linear algebra basics (vectors, matrices)
2. Single-variable calculus
3. Basic probability
4. Descriptive statistics

**Intermediate**:
1. Matrix decompositions
2. Multivariable calculus
3. Probability distributions
4. Inferential statistics
5. Basic optimization

**Advanced**:
1. Convex optimization
2. Information theory
3. Advanced probability
4. Numerical methods

### Practice Recommendations

1. **Implement from Scratch**: Code linear regression, PCA, gradient descent
2. **Visualize**: Plot distributions, decision boundaries, gradients
3. **Work Problems**: Practice derivations and proofs
4. **Apply to Data**: Use real datasets to reinforce concepts
5. **Connect to ML**: Always link math to ML applications

### Key Online Resources

- Khan Academy (calculus, linear algebra, statistics)
- 3Blue1Brown (visual mathematics)
- MIT OpenCourseWare (formal courses)
- StatQuest (statistics and ML)
- Coursera (Mathematics for Machine Learning)

### Books

- "Mathematics for Machine Learning" by Deisenroth et al.
- "The Elements of Statistical Learning" by Hastie et al.
- "Linear Algebra and Its Applications" by Strang
- "Introduction to Probability" by Blitzstein & Hwang
- "Convex Optimization" by Boyd & Vandenberghe

---

## Conclusion

Mathematics is the language of data science. While this guide covers the essential topics, remember that understanding deepens with practice and application. Focus on:

1. **Building intuition** rather than just memorizing formulas
2. **Connecting concepts** across different mathematical domains
3. **Applying to real problems** to see practical relevance
4. **Implementing algorithms** to understand how math translates to code
5. **Iterating** - revisit topics as you learn more advanced concepts

The mathematics you've learned here forms the foundation for understanding and creating sophisticated data science solutions. Keep this as a reference, and don't hesitate to dive deeper into areas most relevant to your work!
