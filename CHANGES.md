# Changes Made for CIFAR-10 Single GPU Training

## Modified Python Files

### 1. `CAKD/dist_train_student.py`
- **Dataset:** ImageFolder → CIFAR-10 (auto-download to `./data`)
- **Distributed training:** Disabled (set `args.distributed = False`)
- **Defaults:** batch_size 32→64, epochs 90→30, workers 16→4
- **Removed:** DistributedDataParallel, distributed sampler epoch sync

### 2. `CAKD/dist_train_logits.py`
- **Dataset:** ImageFolder → CIFAR-10 (auto-download)
- **Distributed training:** Disabled
- **Defaults:** batch_size 32→64, epochs 120→30, workers 16→4
- **Removed:** DistributedDataParallel wrapper for student & teacher

### 3. `CAKD/dist_train_cakd.py`
- **Dataset:** ImageFolder → CIFAR-10 (auto-download)
- **Distributed training:** Disabled
- **Defaults:** batch_size 32→64, epochs 90→30, workers 16→4
- **Removed:** DistributedDataParallel wrappers for model, teacher, discriminator

## New Shell Scripts

### 1. `CAKD/experiments/run_baseline_cifar10.sh`
Runs baseline training on CIFAR-10 (~20-30 min on Colab T4)

### 2. `CAKD/experiments/run_logits_cifar10.sh`
Runs logits KD training (~40-50 min on Colab T4)

### 3. `CAKD/experiments/run_cakd_cifar10.sh`
Runs full CAKD training (~60-75 min on Colab T4)

## Key Configuration Changes

| Setting | Original | Modified |
|---------|----------|----------|
| Dataset | ImageNet | CIFAR-10 |
| Distributed | DDP (8 GPUs) | Single GPU |
| Batch Size | 32 | 64 |
| Epochs | 90-120 | 30 |
| Workers | 16 | 4 |
| Input Size | 224×224 | 224×224 (upsampled from 32×32) |

## Expected Results

- **Baseline:** ~73-75% top-1 accuracy (20-30 min)
- **Logits KD:** ~74-76% top-1 accuracy (40-50 min)
- **CAKD:** ~75-77% top-1 accuracy (60-75 min)

## How to Run

See `COLAB_EXECUTION_GUIDE.md` for execution instructions.
