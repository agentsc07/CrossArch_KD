# GitHub Setup Using VS Code Extension
# Push to GitHub in 2 minutes

## Step 1: Install GitHub Extension
1. Open VS Code
2. Click **Extensions** (left sidebar)
3. Search: `GitHub`
4. Install **"GitHub" by GitHub** (official)

---

## Step 2: Login to GitHub
1. **Cmd + Shift + P** (Command Palette)
2. Type: `GitHub: Authorize`
3. Select it → Click "Allow"
4. Browser opens → Authorize VS Code
5. Done!

---

## Step 3: Create & Push Repo

### Publish from VS Code (Easiest)
1. **Cmd + Shift + P**
2. Type: `Git: Publish to GitHub`
3. Choose **Private repository**
4. Name: `CrossArch_KD_CIFAR10`
5. Done! Repo created + files pushed

---

## Step 4: Commit & Push Changes
1. Click **Source Control** icon (left sidebar)
2. Stage files: Click `+` on changes
3. Write message: `CrossArch_KD for CIFAR-10`
4. Commit: Click ✓
5. Push: Click `Push` button

---

## Step 5: Use in Colab

Your repo URL: `https://github.com/YOUR_USERNAME/CrossArch_KD_CIFAR10`

In Colab cell:
```python
!git clone https://github.com/YOUR_USERNAME/CrossArch_KD_CIFAR10.git
import os
os.chdir("CrossArch_KD_CIFAR10/CAKD")
```

Then use `COLAB_EXECUTION_GUIDE.md` cells.
