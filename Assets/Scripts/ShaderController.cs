using UnityEngine;
using System.Collections;

public class ShaderController : MonoBehaviour {
	private Material material;
	private int count = 50;
	void Start () {
		material = GetComponent<PostEffect> ().pixel;
		material.SetInt ("_Size", count);
	}

	public void Plus(){
		material.SetInt ("_Size", count++);
	}
	
	public void Minus(){
		material.SetInt ("_Size", count--);
	}
}