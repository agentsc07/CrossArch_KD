# Google Colab Execution Guide
# CrossArch_KD CIFAR-10 Training
# Copy & paste cells below into your Colab notebook

## CELL 1: Setup & Clone Repository
```python
# Setup
import os
import subprocess

# Clone the repository (using public repo for now)
# Option A: Clone from original public repo + my modifications
!git clone https://github.com/yufanLIU/CrossArch_KD.git

# Navigate to CAKD directory
os.chdir("/content/CrossArch_KD/CAKD")

print("✓ Repository cloned successfully!")
print("✓ Current directory:", os.getcwd())
print("\nContents:")
!ls -la
```

---

## CELL 2: Verify GPU & Install Dependencies
```python
# Check GPU availability
!nvidia-smi

# Install required packages
!pip install torch torchvision -q

print("\n✓ GPU verified")
print("✓ Dependencies installed")
```

---

## CELL 3: Run Baseline Training (20-30 min)
```python
import os
os.chdir("/content/CrossArch_KD/CAKD")

print("=" * 70)
print("BASELINE TRAINING: ResNet50 on CIFAR-10")
print("Expected time: 20-30 min")
print("Expected accuracy: ~73-75% top-1")
print("=" * 70)

!bash experiments/run_baseline_cifar10.sh
```

---

## CELL 4: Run Logits KD Training (40-50 min)
```python
import os
os.chdir("/content/CrossArch_KD/CAKD")

print("=" * 70)
print("LOGITS KD TRAINING: ResNet50 + ViT-B/16")
print("Expected time: 40-50 min")
print("Expected accuracy: ~74-76% top-1 (+1-2% vs baseline)")
print("=" * 70)

!bash experiments/run_logits_cifar10.sh
```

---

## CELL 5: Run Full CAKD Training (60-75 min)
```python
import os
os.chdir("/content/CrossArch_KD/CAKD")

print("=" * 70)
print("FULL CAKD TRAINING: ResNet50 + ViT-B/16 with Adversarial Training")
print("Expected time: 60-75 min")
print("Expected accuracy: ~75-77% top-1 (+2-3% vs baseline)")
print("=" * 70)

!bash experiments/run_cakd_cifar10.sh
```

---

## CELL 6: Run All Three Sequentially (2.5 hours total)
```python
import os
os.chdir("/content/CrossArch_KD/CAKD")

print("=" * 70)
print("RUNNING ALL THREE EXPERIMENTS")
print("Total expected time: ~2.5 hours")
print("=" * 70)

# Baseline
print("\n[1/3] Starting Baseline Training...")
!bash experiments/run_baseline_cifar10.sh

# Logits KD
print("\n[2/3] Starting Logits KD Training...")
!bash experiments/run_logits_cifar10.sh

# CAKD
print("\n[3/3] Starting CAKD Training...")
!bash experiments/run_cakd_cifar10.sh

print("\n" + "=" * 70)
print("✓ ALL TRAINING COMPLETE!")
print("=" * 70)
```

---

## CELL 7: Check Results
```python
import os
os.chdir("/content/CrossArch_KD/CAKD")

print("=" * 70)
print("RESULTS SUMMARY")
print("=" * 70)

# List generated directories
import subprocess

print("\n📁 Generated directories:")
!ls -lh results/ 2>/dev/null || echo "No results yet"

print("\n📊 Checking checkpoints:")
!find results/ -name "*.pth" -type f 2>/dev/null | head -20 || echo "No checkpoints yet"

print("\n💾 Dataset cache:")
!du -sh data/ 2>/dev/null || echo "No data downloaded yet"
```

---

## CELL 8: Download Results from Colab
```python
# If you want to download results to your local machine
# Run this to create a downloadable zip

import os
import shutil

os.chdir("/content/CrossArch_KD/CAKD")

# Create zip of results
!zip -r results.zip results/ -q 2>/dev/null || echo "Creating backup..."

print("✓ Results packaged")
print("Download 'results.zip' from Colab files")
```

---

# ALTERNATIVE: Using Your Own Private Repository

If you want to use a **private GitHub repo** instead:

## Step 1: Create Private Repo on GitHub
1. Go to https://github.com/new
2. Create repo (e.g., `CrossArch_KD_CIFAR10`)
3. Set it to **Private**
4. Clone to your local machine
5. Copy modified files from `/Users/saicharan/Desktop/AI-ML/PROJECT/CrossArch_KD/CAKD/` to your repo

## Step 2: Push to GitHub
```bash
cd your_repo
git add .
git commit -m "CIFAR-10 adapted CrossArch_KD"
git push origin main
```

## Step 3: Clone in Colab (with authentication)
```python
# Option A: If repo is public
!git clone https://github.com/YOUR_USERNAME/CrossArch_KD_CIFAR10.git

# Option B: If repo is private (use GitHub token)
import os
GITHUB_TOKEN = "YOUR_GITHUB_TOKEN"  # Get from https://github.com/settings/tokens
REPO_URL = "https://YOUR_USERNAME:YOUR_GITHUB_TOKEN@github.com/YOUR_USERNAME/CrossArch_KD_CIFAR10.git"
!git clone {REPO_URL}

os.chdir("CrossArch_KD_CIFAR10/CAKD")
```

---

# QUICK COPY-PASTE: All in One Cell

If you prefer everything in one cell:

```python
# Complete Colab execution
import os
import subprocess

# 1. Clone
!git clone https://github.com/yufanLIU/CrossArch_KD.git
os.chdir("/content/CrossArch_KD/CAKD")

# 2. Check GPU
!nvidia-smi | head -10

# 3. Install
!pip install torch torchvision -q

# 4. Run all experiments
print("Starting experiments (2.5 hours)...")

!bash experiments/run_baseline_cifar10.sh
!bash experiments/run_logits_cifar10.sh
!bash experiments/run_cakd_cifar10.sh

print("✓ Complete!")

# 5. Package results
!zip -r results.zip results/ -q
print("Download results.zip when ready")
```

---

# Files You'll Get

After cloning, you'll have:

```
CrossArch_KD/
├── CHANGELOG.md                    ✓ Complete technical changelog
├── CIFAR10_COLAB_SETUP.md         ✓ Colab setup guide
├── MODIFICATIONS_SUMMARY.md        ✓ Quick reference
├── DOCUMENTATION_INDEX.md          ✓ Navigation guide
└── CAKD/
    ├── dist_train_student.py       ✓ Modified (baseline)
    ├── dist_train_logits.py        ✓ Modified (logits KD)
    ├── dist_train_cakd.py          ✓ Modified (full CAKD)
    ├── experiments/
    │   ├── run_baseline_cifar10.sh  ✓ Colab-ready
    │   ├── run_logits_cifar10.sh    ✓ Colab-ready
    │   └── run_cakd_cifar10.sh      ✓ Colab-ready
    └── ...
```

---

# Recommended Action

**Easiest: Copy Cell 1 (Setup) + Cell 6 (Run All) into Colab and execute**

That's it! Everything else is automated.

Need help? Check the DOCUMENTATION files that come with the repo.
