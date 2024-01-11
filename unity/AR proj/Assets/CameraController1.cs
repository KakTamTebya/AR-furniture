using UnityEngine;
using System.Collections;

public class CameraController1 : MonoBehaviour
{
    private WebCamTexture cameraTexture;

    void Start()
    {
        // �������� ������ ��������� �����
        WebCamDevice[] devices = WebCamTexture.devices;

        if (devices.Length > 0)
        {
            // ���������� ������ ��������� ������
            cameraTexture = new WebCamTexture(devices[0].name, Screen.width, Screen.height);

            // ��������� �������� � ������� � ����������
            GetComponent<Renderer>().material.mainTexture = cameraTexture;

            // ��������� ������
            cameraTexture.Play();
        }
        else
        {
            Debug.LogError("No camera found on the device.");
        }
    }
}
