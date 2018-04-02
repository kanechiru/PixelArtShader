using UnityEngine;
using System.Collections;

public class PostEffect : MonoBehaviour {

	public Material pixel;

	void OnRenderImage(RenderTexture src, RenderTexture dest)
	{
		Graphics.Blit (src, dest, pixel);
	}
}
