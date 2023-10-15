import numpy as np
import pandas as pd
import librosa as lr
import matplotlib.pyplot as plt
from types import SimpleNamespace
import math


audio_config = SimpleNamespace(
    base_path = "/workspaces/system_project/audio_processing/assets/audio",
    sr = 44100,
    mono = True,
    block_size = 100, #in ms
)


class FingerprintPipeline:
    def __init__(self):
        pass

    def read_audio(self, file_name):
        audio_content, _ = lr.load(audio_config.base_path + "/" + file_name, sr=audio_config.sr)
        block_count = int(len(audio_content) * (1000 / 100) / audio_config.sr) #as 1000ms -> 1sec
        per_block_length = audio_config.sr * audio_config.block_size / 1000
        blocks= []

        for idx in range(block_count):
            start_idx = int(per_block_length * idx)
            end_idx = int(per_block_length * (idx + 1))
            blocks.append(audio_content[start_idx: end_idx])

        return blocks


    def fourier_transform(self, audio_blocks):
        dft_transformed = []
        for block in audio_blocks:
            _fft_res_arr = (np.fft.fft(block))
            dft_transformed.append(_fft_res_arr)

        return dft_transformed
    
    def complex_eval(self, complex_matrix):
        eval_arr = []
        for cmplex_arr in complex_matrix:
            tmp_array = []
            for sv in cmplex_arr:
                sv_bar = complex(sv.real, -sv.imag)
                tmp_array.append((sv * sv_bar).real)
                tmp_array.sort()
            eval_arr.append(tmp_array)
        
        return eval_arr

    def get_range_max(self, audio_block):
        pass

    def fingerprint(self, file_name):
        audio_blocks = self.read_audio(file_name=file_name)
        audio_blocks = self.fourier_transform(audio_blocks=audio_blocks)
        audio_blocks = self.complex_eval(audio_blocks)
        
        return np.array(audio_blocks)

    
pipeline = FingerprintPipeline()
x = pipeline.fingerprint("file_1.mp3")

print(x)