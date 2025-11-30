# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.0-base

# install custom nodes into comfyui
RUN comfy node install --exit-on-fail was-node-suite-comfyui@1.0.2
RUN comfy node install --exit-on-fail comfyui_tinyterranodes@2.0.9
RUN comfy node install --exit-on-fail ComfyUI-GGUF@1.1.9
RUN comfy node install --exit-on-fail rgthree-comfy@1.0.2511270846

# download models into comfyui
RUN comfy model download --url https://huggingface.co/QuantStack/Wan2.2-T2V-A14B-GGUF/resolve/main/LowNoise/Wan2.2-T2V-A14B-LowNoise-Q4_K_M.gguf --relative-path models/diffusion_models --filename Wan2.2-T2V-A14B-LowNoise-Q4_K_M.gguf
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp16.safetensors --relative-path models/clip --filename umt5_xxl_fp16.safetensors
RUN comfy model download --url https://huggingface.co/ibuildproducts/instagirlv2/resolve/main/Instagirlv2.0_lownoise.safetensors --relative-path models/loras --filename Instagirlv2.0_lownoise.safetensors
# RUN # Could not find URL for Jenna02s.safetensors
RUN comfy model download --url https://huggingface.co/Aitrepreneur/FLX/resolve/main/Wan2.2-Lightning_T2V-v1.1-A14B-4steps-lora_HIGH_fp16.safetensors --relative-path models/loras --filename Wan2.2-Lightning_T2V-v1.1-A14B-4steps-lora_HIGH_fp16.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors --relative-path models/vae --filename wan_2.1_vae.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
