#!/bin/bash

################################################################################\n# CIFAR-10 Logits Knowledge Distillation Training Script (NEW)
# 
# Trains ResNet50 with logits matching from ViT-B/16 teacher
# Dataset: CIFAR-10 (50K training images, auto-downloads)
# Configuration: Single GPU, 30 epochs, batch size 64
# Expected Runtime: ~40-50 min on Colab T4
# Expected Accuracy: ~74-76% top-1 on CIFAR-10 (~+1-2% vs baseline)
#
# Modified from: experiments/run_logits.sh (original ImageNet version)
#
# METHOD: Knowledge Distillation via logits MSE loss
# Teacher: ViT-B/16 (pre-trained on ImageNet)
# Student: ResNet50
#
# See also:
#   - ../CHANGELOG.md for all modifications
#   - dist_train_logits.py for full script
#   - ../CIFAR10_COLAB_SETUP.md for Colab instructions
################################################################################

# Run ResNet50 + ViT-B/16 Logits KD on CIFAR-10 (no distributed training, single GPU)
python dist_train_logits.py \
  --batch-size 64 \
  --lr 0.1 \
  --epochs 1 \
  --label-smoothing 0.1 \
  --train-crop-size 224 \
  --val-resize-size 224 \
  --workers 4 \
  --output-dir results/cifar10_logits_vitb16 \
  --device cuda \
  --model-ema
