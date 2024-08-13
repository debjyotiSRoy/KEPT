CUDA_VISIBLE_DEVICES=0 python run_coder.py \
                --ddp_find_unused_parameters False --seed 47 \
                --disable_tqdm True \
                --version mimic3 --model_name_or_path whaleloops/keptlongformer \
                --do_train --do_eval --max_seq_length 8192 \
                --per_device_train_batch_size 1 --per_device_eval_batch_size 2 \
                --learning_rate 1.5e-5 --weight_decay 1e-4 --adam_epsilon 1e-7 --num_train_epochs 4 --warmup_ratio 0.1 \
                --evaluation_strategy epoch --save_strategy epoch \
                --load_best_model_at_end True --metric_for_best_model eval_f1_macro --greater_is_better True \
                --rerank_pred_folder1 ./sample_data/mimic3/msmn_300_preds \
                --logging_first_step --gradient_accumulation_steps 6 --global_attention_strides 3 \
                --output_dir ./saved_models/longformer-original-clinical-promptfull-oracle-300-rand