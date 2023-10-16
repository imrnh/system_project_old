from audio_fingerprinting_with_dft import FingerprintPipeline

pipeline = FingerprintPipeline()
fingerprints = pipeline.fingerprint("file_1.mp3")

for x in fingerprints:
    print(x)