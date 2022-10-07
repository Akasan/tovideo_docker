import click
import os
import cv2
from glob import glob


def to_images():
    while True:
        filelist = glob(os.path.join("/videos", "*.mp4"))
        if len(filelist) == 0:
            continue

        video_filename = filelist[0]
        out_folder = os.path.join("/images", os.path.basename(video_filename).split(".")[0])
        if not os.path.exists(out_folder):
            os.makedirs(out_folder)
        # out_folder = os.environ.get("OUT_PATH")

        cap = cv2.VideoCapture(video_filename)

        cnt = 1
        while True:
            ret, frame = cap.read()
            if not ret:
                break

            cv2.imwrite(os.path.join(out_folder, f"{cnt}.png"), frame)
            cnt += 1

        cap.release()
        os.remove(video_filename)


if __name__ == "__main__":
    to_images()
