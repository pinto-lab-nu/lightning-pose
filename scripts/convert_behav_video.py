import ffmpeg 
import os 
import argparse


def convert_behav_video(pathname: str):
	
	fnames = os.listdir(pathname);
	
	if not 'behavVideo_concat.mp4' in fnames: 
		if 'behavVideo_concat.avi' in fnames:
			print('concatenated')
			ffmpeg.input(os.path.join(pathname,'behavVideo_concat.avi')).output(os.path.join(pathname,'behavVideo_concat.mp4'),pix_fmt='yuv420p').run()
		else:
			flist  = [f for f in fnames if f.endswith('avi')]
			flists = [];
			for i in range(0,len(flist)):
				flists.append(os.path.join(pathname,str(i)+'.avi'))
			
			streams = []
			for f in flists:
				streams.append(ffmpeg.input(f))
	
			ffmpeg.concat(*streams).output(os.path.join(pathname,'behavVideo_concat.mp4'),pix_fmt='yuv420p').run()
	
			
if __name__ == "__main__":
	parser = argparse.ArgumentParser() 
	parser.add_argument("pathname",type=str)
	args = parser.parse_args()   
	convert_behav_video(args.pathname)		
			
			
		 
			
	



	