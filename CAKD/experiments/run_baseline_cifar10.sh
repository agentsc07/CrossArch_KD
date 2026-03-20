#!/bin/bash

################################################################################
# CIFAR-10 Baseline Training Script (NEW)
# 
# Trains ResNet50 WITHOUT knowledge distillation (baseline)
# Dataset: CIFAR-10 (50K training images, auto-downloads)
# Configuration: Single GPU, 30 epochs, batch size 64
# Expected Runtime: ~20-30 min on Colab T4
# Expected Accuracy: ~73-75% top-1 on CIFAR-10
#
# Modified from: experiments/run_baseline.sh (original ImageNet version)
#
# See also:
#   - ../CHANGELOG.md for all modifications
#   - dist_train_student.py for full script
#   - ../CIFAR10_COLAB_SETUP.md for Colab instructions
################################################################################

# Run baseline ResNet50 on CIFAR-10 (no distributed training, single GPU)
python dist_train_student.py \
  --batch-size 64 \
  --lr 0.1 \
  --epochs 1 \
  --train-crop-size 224 \
  --val-resize-size 224 \
  --workers 4 \
  --output-dir results/cifar10_baseline \
  --device cuda
