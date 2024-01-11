using UnityEngine;
using System.Collections;

public class CameraController1 : MonoBehaviour
{
    private WebCamTexture cameraTexture;

    void Start()
    {
        // Получаем список доступных камер
        WebCamDevice[] devices = WebCamTexture.devices;

        if (devices.Length > 0)
        {
            // Используем первую доступную камеру
            cameraTexture = new WebCamTexture(devices[0].name, Screen.width, Screen.height);

            // Применяем текстуру к объекту с рендерером
            GetComponent<Renderer>().material.mainTexture = cameraTexture;

            // Запускаем камеру
            cameraTexture.Play();
        }
        else
        {
            Debug.LogError("No camera found on the device.");
        }
    }
}
