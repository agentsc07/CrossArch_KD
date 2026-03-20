#!/bin/bash\n\n################################################################################\n# CIFAR-10 Cross-Architecture Knowledge Distillation (CAKD) Training Script (NEW)
# 
# Trains ResNet50 with full CAKD from ViT-B/16 teacher (with adversarial training)
# Dataset: CIFAR-10 (50K training images, auto-downloads)
# Configuration: Single GPU, 30 epochs, batch size 64
# Expected Runtime: ~60-75 min on Colab T4
# Expected Accuracy: ~75-77% top-1 on CIFAR-10 (~+2-3% vs baseline)
#
# Modified from: experiments/run_cakd.sh (original ImageNet version)
#
# METHOD: Full Cross-Architecture Knowledge Distillation with three components:
# 1. Partial Cross Attention (PCA) projector loss
# 2. Group-wise Linear (GL) projector loss
# 3. Generative Adversarial Network (GAN) loss for adversarial training
#
# Teacher: ViT-B/16 (pre-trained on ImageNet)
# Student: ResNet50 with CAKD projectors
# Discriminator: NLayerDiscriminator (for adversarial training)
#
# See also:
#   - ../CHANGELOG.md for all modifications
#   - dist_train_cakd.py for full script
#   - ../CIFAR10_COLAB_SETUP.md for Colab instructions
################################################################################

# Run ResNet50 + ViT-B/16 Cross-Architecture KD on CIFAR-10 (no distributed training, single GPU)
python dist_train_cakd.py \
  --batch-size 64 \
  --lr 0.1 \
  --epochs 30 \
  --auto-augment ta_wide \
  --random-erase 0.1 \
  --mixup-alpha 0.2 \
  --weight-decay 0.00002 \
  --norm-weight-decay 0.0 \
  --label-smoothing 0.1 \
  --train-crop-size 224 \
  --val-resize-size 224 \
  --workers 4 \
  --output-dir results/cifar10_cakd_vitb16 \
  --device cuda \
  --model-ema
